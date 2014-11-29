using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Runtime.InteropServices;

namespace ClientLoader
{
    public class GameLoader : IDisposable
    {
        private GCHandle processObject;

        public GameLoader()
        {
            processObject = GCHandle.Alloc(new Process(), GCHandleType.Normal);
        }

        public Process Process { get { return (Process)processObject.Target; } }

        public void Init(string exe)
        {
            if (File.Exists(exe))
                Process.StartInfo.FileName = exe;
            else throw new FileNotFoundException("The specific file was not found.", exe, null);
        }

        public void LoadFromMemory(string assemblyStream)
        {
            Stream file = typeof(GameLoader).Assembly.GetManifestResourceStream(assemblyStream);
            byte[] buffer = new byte[file.Length];
            int len = file.Read(buffer, 0, buffer.Length);

            if (file.Position != len)
                throw new System.IO.InvalidDataException("The stream length is not the same as the readed lenght", null);

            buffer = cryptFile(buffer);

            string path = String.Format("{0}\\WebMain.swf", Application.StartupPath);
            using (BinaryWriter binWriter = new BinaryWriter(File.Open(path, FileMode.OpenOrCreate)))
                binWriter.Write(buffer);
        }

        public void StartGame()
        {
            Process.StartInfo.Arguments = String.Format("{0}\\WebMain.swf", Application.StartupPath);
            Process.Start();

            deleteAfterStart();
        }

        private void deleteAfterStart()
        {
            Process.WaitForInputIdle();
            while (isFileInUse(String.Format("{0}\\WebMain.swf", Application.StartupPath))) Thread.Sleep(100);
            if (File.Exists(String.Format("{0}\\WebMain.swf", Application.StartupPath)))
                File.Delete(String.Format("{0}\\WebMain.swf", Application.StartupPath));
        }

        private byte[] cryptFile(byte[] data)
        {
            var engine1 = new RC4(new byte[] { 0x31, 0x1f, 0x80, 0x69, 0x14, 0x51, 0xc7, 0x1b, 0x09, 0xa1, 0x3a, 0x2a, 0x6e });
            var engine2 = new RC4(new byte[] { 0x72, 0xc5, 0x58, 0x3c, 0xaf, 0xb6, 0x81, 0x89, 0x95, 0xcb, 0xd7, 0x4b, 0x80 });

            return engine1.Crypt(engine2.Crypt(engine1.Crypt(engine2.Crypt(data))));
        }

        private static bool isFileInUse(string file)
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
            catch (Exception)
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

        public void Dispose()
        {
            try
            {
                if (Process != null)
                {
                    Process.Kill();
                    Process.WaitForExit();
                    if (processObject.IsAllocated)
                        processObject.Free();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Please close it manualy via taskmanager\nSearch for flashplayer.exe in the process list.\n\nAdditional Information:\n" + ex.ToString(), "Could not close flashplayer.", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
