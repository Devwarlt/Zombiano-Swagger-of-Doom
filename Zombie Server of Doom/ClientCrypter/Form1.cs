using System;
using System.IO;
using System.Windows.Forms;

namespace ClientCrypter
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Stream clientStream = typeof(Form1).Assembly.GetManifestResourceStream("ClientCrypter.gameClient.WebMain.swf");
            byte[] buffer = new byte[clientStream.Length];
            clientStream.Read(buffer, 0, buffer.Length);

            var engine1 = new RC4(new byte[] { 0x31, 0x1f, 0x80, 0x69, 0x14, 0x51, 0xc7, 0x1b, 0x09, 0xa1, 0x3a, 0x2a, 0x6e });
            var engine2 = new RC4(new byte[] { 0x72, 0xc5, 0x58, 0x3c, 0xaf, 0xb6, 0x81, 0x89, 0x95, 0xcb, 0xd7, 0x4b, 0x80 });
            buffer = engine1.Crypt(engine2.Crypt(engine1.Crypt(engine2.Crypt(buffer))));

            File.WriteAllBytes("client.dat", buffer);
            MessageBox.Show("Done");
        }

        private void button2_Click(object sender, EventArgs e)
        {
            byte[] data = File.ReadAllBytes("client");
            var engine1 = new RC4(new byte[] { 0x31, 0x1f, 0x80, 0x69, 0x14, 0x51, 0xc7, 0x1b, 0x09, 0xa1, 0x3a, 0x2a, 0x6e });
            var engine2 = new RC4(new byte[] { 0x72, 0xc5, 0x58, 0x3c, 0xaf, 0xb6, 0x81, 0x89, 0x95, 0xcb, 0xd7, 0x4b, 0x80 });

            data = engine1.Crypt(engine2.Crypt(engine1.Crypt(engine2.Crypt(data))));

            string path = "WebMain.swf";
            using (BinaryWriter binWriter = new BinaryWriter(File.Open(path, FileMode.OpenOrCreate)))
                binWriter.Write(data);

            System.Diagnostics.Process p = new System.Diagnostics.Process();
            p.StartInfo = new System.Diagnostics.ProcessStartInfo("flashplayer.exe", Application.StartupPath + "\\WebMain.swf");
            p.Start();
            p.WaitForInputIdle(500);
            while (isFileInUse(Application.UserAppDataPath + "\\WebMain.swf")) ;
            File.Delete("WebMain.swf");
        }

        private bool isFileInUse(string file)
        {
            FileStream stream = null;
            FileInfo info = new FileInfo(file);

            try
            {
                stream = info.Open(FileMode.Open, FileAccess.ReadWrite, FileShare.None);
            }
            catch (IOException)
            {
                return true;
            }
            finally
            {
                if (stream != null)
                    stream.Close();
            }
            return false;
        }
    }
}
