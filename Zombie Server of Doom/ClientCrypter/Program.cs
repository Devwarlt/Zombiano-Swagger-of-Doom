using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;

namespace ClientCrypter
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            try
            {
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new Form1());
            }
            catch (COMException ex)
            {
                MessageBox.Show(ex.ToString(), "Error while loading components", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
