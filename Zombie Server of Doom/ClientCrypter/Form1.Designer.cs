namespace ClientCrypter
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.cryptClientBtn = new System.Windows.Forms.Button();
            this.testClientBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // button1
            // 
            this.cryptClientBtn.Location = new System.Drawing.Point(12, 12);
            this.cryptClientBtn.Name = "cryptClientBtn";
            this.cryptClientBtn.Size = new System.Drawing.Size(260, 23);
            this.cryptClientBtn.TabIndex = 0;
            this.cryptClientBtn.Text = "Crypt Client";
            this.cryptClientBtn.UseVisualStyleBackColor = true;
            this.cryptClientBtn.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.testClientBtn.Location = new System.Drawing.Point(12, 41);
            this.testClientBtn.Name = "testClientBtn";
            this.testClientBtn.Size = new System.Drawing.Size(260, 23);
            this.testClientBtn.TabIndex = 2;
            this.testClientBtn.Text = "TestClient";
            this.testClientBtn.UseVisualStyleBackColor = true;
            this.testClientBtn.Click += new System.EventHandler(this.button2_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 76);
            this.Controls.Add(this.testClientBtn);
            this.Controls.Add(this.cryptClientBtn);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button cryptClientBtn;
        private System.Windows.Forms.Button testClientBtn;

    }
}

