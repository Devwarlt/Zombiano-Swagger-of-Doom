using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace ClientLoader
{
    public partial class ZombieSwaggerOfDoom : Form
    {
        public const int FORM_WIDTH = 816;
        public const int FORM_HEIGHT = 638;

        public const int FORMBORDER_X = 16;
        public const int FORMBORDER_Y = 38;

        public const int XPOINT = 0;
        public const int YPOINT = -20;

        private GameLoader loader;

        public ZombieSwaggerOfDoom()
        {
            InitializeComponent();
            this.Size = new Size(FORM_WIDTH, FORM_HEIGHT);
            loader = new GameLoader();
            loader.Init(String.Format("{0}\\flashplayer.exe", Application.StartupPath));
            loader.LoadFromMemory("ClientLoader.gameClient.client.dat");
            loader.StartGame();

            DllImports.SetParent(loader.Process.MainWindowHandle, this.Handle);
            DllImports.MoveWindow(loader.Process.MainWindowHandle, XPOINT, YPOINT, 800, 620, true);
            DllImports.SetWindowLong(loader.Process.MainWindowHandle, -16, 0x10000000);

            this.SizeChanged += (sender, e) =>
            {
                if (this.Size.Width < FORM_WIDTH || this.Size.Height < FORM_HEIGHT)
                    this.Size = new System.Drawing.Size(FORM_WIDTH, FORM_HEIGHT);

                DllImports.MoveWindow(loader.Process.MainWindowHandle, XPOINT, YPOINT, this.Size.Width - FORMBORDER_X, (this.Size.Height - FORMBORDER_Y) + 20, true);
            };
        }

        protected override void OnClosing(CancelEventArgs e)
        {
            loader.Dispose();
            base.OnClosing(e);
        }
    }
}
