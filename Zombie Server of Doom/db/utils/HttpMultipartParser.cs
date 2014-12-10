using System;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Collections.Generic;

namespace db.utils
{
    public class HttpMultipartParser
    {
        public HttpMultipartParser(Stream stream, Encoding encoding, string filePartName)
        {
            FilePartName = filePartName;
            this.Parse(stream, encoding);
        }

        private void Parse(Stream stream, Encoding encoding)
        {
            this.Success = false;

            byte[] data = Misc.ToByteArray(stream);
            string content = encoding.GetString(data);
            int delimiterEndIndex = content.IndexOf("\r\n");

            if (delimiterEndIndex > -1)
            {
                string delimiter = content.Substring(0, content.IndexOf("\r\n"));
                string[] sections = content.Split(new string[] { delimiter }, StringSplitOptions.RemoveEmptyEntries);

                foreach (string s in sections)
                {
                    if (s.Contains("Content-Disposition"))
                    {
                        Match nameMatch = new Regex(@"(?<=name\=\"")(.*?)(?=\"")").Match(s);
                        string name = nameMatch.Value.Trim().ToLower();

                        if (name == FilePartName)
                        {
                            Regex re = new Regex(@"(?<=Content\-Type:)(.*?)(?=\r\n\r\n)");
                            Match contentTypeMatch = re.Match(content);

                            re = new Regex(@"(?<=filename\=\"")(.*?)(?=\"")");
                            Match filenameMatch = re.Match(content);

                            if (contentTypeMatch.Success && filenameMatch.Success)
                            {
                                this.ContentType = contentTypeMatch.Value.Trim();
                                this.Filename = filenameMatch.Value.Trim();
                                int startIndex = contentTypeMatch.Index + contentTypeMatch.Length + "\r\n\r\n".Length;
                                byte[] delimiterBytes = encoding.GetBytes("\r\n" + delimiter);
                                int endIndex = Misc.IndexOf(data, delimiterBytes, startIndex);
                                int contentLength = endIndex - startIndex;
                                byte[] fileData = new byte[contentLength];
                                Buffer.BlockCopy(data, startIndex, fileData, 0, contentLength);
                                this.FileContents = fileData;
                            }
                        }
                        else if (!string.IsNullOrWhiteSpace(name))
                        {
                            int startIndex = nameMatch.Index + nameMatch.Length + "\r\n\r\n".Length;
                            Parameters.Add(name, s.Substring(startIndex).TrimEnd(new char[] { '\r', '\n' }).Trim());
                        }
                    }
                }

                if (FileContents != null || Parameters.Count != 0)
                    this.Success = true;
            }
        }

        public IDictionary<string, string> Parameters = new Dictionary<string, string>();

        public string FilePartName { get; private set; }
        public bool Success { get; private set; }
        public string Title { get; private set; }
        public int UserId { get; private set; }
        public string ContentType { get; private set; }
        public string Filename {  get; private set; }
        public byte[] FileContents { get; private set; }
    }
}
