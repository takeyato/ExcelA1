using System.Drawing;
using System.Windows.Forms;

public partial class EditForm : Form
{
    private Bitmap image;
    private Graphics graphics;
    private Pen pen;

    public EditForm(Bitmap screenshot)
    {
        InitializeComponent();
        image = screenshot;
        this.BackgroundImage = image;
        graphics = Graphics.FromImage(image);
        pen = new Pen(Color.Red, 5);
    }

    private void EditForm_MouseDown(object sender, MouseEventArgs e)
    {
        if (e.Button == MouseButtons.Left)
        {
            graphics.DrawLine(pen, e.X, e.Y, e.X + 1, e.Y + 1);
            this.Invalidate();
        }
    }

    private void EditForm_MouseMove(object sender, MouseEventArgs e)
    {
        if (e.Button == MouseButtons.Left)
        {
            graphics.DrawLine(pen, e.X, e.Y, e.X + 1, e.Y + 1);
            this.Invalidate();
        }
    }
}
