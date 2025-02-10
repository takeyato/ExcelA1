using System;
using System.Drawing;
using System.Windows.Forms;
using System.Drawing.Imaging;

public partial class MainForm : Form
{
    public MainForm()
    {
        InitializeComponent();
    }

    private void CaptureScreen(bool fullScreen)
    {
        Bitmap screenshot;
        if (fullScreen)
        {
            screenshot = new Bitmap(Screen.PrimaryScreen.Bounds.Width, Screen.PrimaryScreen.Bounds.Height);
            Graphics g = Graphics.FromImage(screenshot);
            g.CopyFromScreen(0, 0, 0, 0, Screen.PrimaryScreen.Bounds.Size);
        }
        else
        {
            Rectangle rect = this.Bounds;
            screenshot = new Bitmap(rect.Width, rect.Height);
            Graphics g = Graphics.FromImage(screenshot);
            g.CopyFromScreen(rect.Left, rect.Top, 0, 0, rect.Size);
        }
        screenshot.Save("screenshot.png", ImageFormat.Png);
    }
}
