﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Threading;
using QUANLYKHACHSAN_PHANTAN.NhanVien_Wcf;
namespace QUANLYKHACHSAN_PHANTAN
{
    public partial class frmMain : Form
    {
        int id_nhanvien;
        public bool isDead = false;
        bool isDangXuat = false;

        public int Id_nhanvien
        {
            get
            {
                return id_nhanvien;
            }

            set
            {
                id_nhanvien = value;
            }
        }

        public frmMain()
        {
            InitializeComponent();
            this.StartPosition = FormStartPosition.CenterScreen;
        }

        public frmMain(int id_nv)
        {
            InitializeComponent();
            Id_nhanvien = id_nv;

            this.StartPosition = FormStartPosition.CenterScreen;
        }


        private void Custom_Theme()
        {
            this.btnShowMenu.Image = imgs_Button.Images[0];
            this.btnTaiKhoan.Image = imgs_Button.Images[1];
            this.btnDatPhong.Image = imgs_Button.Images[2];
            this.btnKhachHang.Image = imgs_Button.Images[3];

            this.btnCheckOut.Image = imgs_Button.Images[4];
            this.btnBaoCao.Image = imgs_Button.Images[5];
            this.btnPhong.Image = imgs_Button.Images[6];
            this.btnDichVu.Image = imgs_Button.Images[7];
            this.btnDatDichVu.Image = imgs_Button.Images[8];

            ////Loading Background Image MainForm
            //this.pnl_SubForm.BackgroundImage = Resource_Img.bg_lobbyHotel;
            //this.pnl_SubForm.BackgroundImageLayout = ImageLayout.Stretch;
        }

        private void frmMain_Load(object sender, EventArgs e)
        {
            Custom_Theme();
            NhanVien_WCFClient nv_wcf = new NhanVien_WCFClient();

            this.lbAccount.Text = "Xin Chào, " + nv_wcf.GetHoTen_NhanVien(Id_nhanvien);
           //this.btnCheckOut.Visible = false;

            open_frmDatPhong();
        }

        private void btnShowMenu_Click(object sender, EventArgs e)
        {
            if (this.pnl_Menu.Visible)
            {
                this.pnl_Menu.Visible = false;
            }
            else
            {
                this.pnl_Menu.Visible = true;
            }
        }



        private void timerSystem_Tick(object sender, EventArgs e)
        {
            this.lbTime.Text = DateTime.Now.ToString();
        }

        private void btnTaiKhoan_MouseClick(object sender, MouseEventArgs e)
        {
            cmnstrp_NhanVien.Show(btnTaiKhoan, new Point(e.X, e.Y));
        }

        private void back_login()
        {
            Application.Run(new frmLogin());
        }

        private void DangXuatToolStripMenuItem_Click(object sender, EventArgs e)
        {
            isDangXuat = true;
            DialogResult ds = MessageBox.Show("Bạn Có Muốn Đăng Xuất ?", "QUAY VỀ ĐĂNG NHẬP", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
            if (ds == DialogResult.Yes)
            {
                Thread th = new Thread(back_login);

#pragma warning disable CS0618 // Type or member is obsolete
                th.ApartmentState = ApartmentState.STA;
#pragma warning restore CS0618 // Type or member is obsolete

                th.Start();

                this.Close();
            }
            else
            {
                return;
            }
        }

        private void open_frmQuanLyTaiKhoan()
        {
            this.pnl_SubForm.Controls.Clear();

            frmQuanLyNhanVien fqltk = new frmQuanLyNhanVien();
            fqltk.TopLevel = false;
            fqltk.Dock = DockStyle.Fill;
            fqltk.ShowInTaskbar = false;
            fqltk.Show();

            this.pnl_SubForm.Controls.Add(fqltk);
        }

        private void QuanLyNhanVienToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (this.pnl_SubForm.Controls.Count == 1)
            {
                MessageBox.Show("Có Form Đang Chạy", "", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            open_frmQuanLyTaiKhoan();

        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(isDead == false)
            {
                if (!isDangXuat)
                {
                    DialogResult ds = MessageBox.Show("Bạn Có Muốn Thoát ?", "THOÁT", MessageBoxButtons.YesNo, MessageBoxIcon.Stop);

                    if (ds == DialogResult.Yes)
                    {
                        Environment.Exit(0);
                    }
                    else
                    {
                        e.Cancel = true;
                    }
                }
            }
        }

        private void DoiMatKhauToolStripMenuItem_Click(object sender, EventArgs e)
        {
            NhanVien_WCFClient nv_wcf = new NhanVien_WCFClient();
            string email = nv_wcf.GetEmail_by_ID(Id_nhanvien);
            frmDoiMatKhau fdmk = new frmDoiMatKhau(email, this);
            fdmk.FormBorderStyle = FormBorderStyle.None;
            fdmk.ShowDialog();
        }

        private void open_frmQuanLyKhachHang()
        {
            this.pnl_SubForm.Controls.Clear();

            frmQLKhachHang fqlkh = new frmQLKhachHang();
            fqlkh.FormBorderStyle = FormBorderStyle.None;
            fqlkh.TopLevel = false;
            fqlkh.Dock = DockStyle.Fill;
            fqlkh.ShowInTaskbar = false;
            fqlkh.Show();

            this.pnl_SubForm.Controls.Add(fqlkh);
        }

        private void btnKhachHang_Click(object sender, EventArgs e)
        {
            open_frmQuanLyKhachHang();
        }

        private void open_frmDatPhong()
        {
            this.pnl_SubForm.Controls.Clear();

            frmDatPhong fdp = new frmDatPhong(Id_nhanvien);
            fdp.FormBorderStyle = FormBorderStyle.None;
            fdp.TopLevel = false;
            fdp.Dock = DockStyle.Fill;
            fdp.ShowInTaskbar = false;
            fdp.Show();

            this.pnl_SubForm.Controls.Add(fdp);
        }

        private void btnDatPhong_Click(object sender, EventArgs e)
        {
            open_frmDatPhong();
        }

        private void open_frmDichVu()
        {
            this.pnl_SubForm.Controls.Clear();

            frmQLDichVu fdp = new frmQLDichVu();
            fdp.FormBorderStyle = FormBorderStyle.None;
            fdp.TopLevel = false;
            fdp.Dock = DockStyle.Fill;
            fdp.ShowInTaskbar = false;
            fdp.Show();

            this.pnl_SubForm.Controls.Add(fdp);
        }

        private void btnDichVu_Click(object sender, EventArgs e)
        {
            open_frmDichVu();
        }

        private void btnCheckOut_Click(object sender, EventArgs e)
        {
            open_frmTraPhong();
        }

        private void open_frmQuanLyPhong()
        {
            this.pnl_SubForm.Controls.Clear();

            frmQuanLyPhong fdp = new frmQuanLyPhong();
            fdp.FormBorderStyle = FormBorderStyle.None;
            fdp.TopLevel = false;
            fdp.Dock = DockStyle.Fill;
            fdp.ShowInTaskbar = false;
            fdp.Show();

            this.pnl_SubForm.Controls.Add(fdp);
        }

        private void btnPhong_Click(object sender, EventArgs e)
        {
            open_frmQuanLyPhong();
        }

        private void btnDatDichVu_Click(object sender, EventArgs e)
        {
            frmMuaBanDichVu frmMua = new frmMuaBanDichVu(Id_nhanvien);
            frmMua.ShowDialog();
        }

        private void open_frmTraPhong()
        {
            this.pnl_SubForm.Controls.Clear();

            frmTraPhong fdp = new frmTraPhong();
            fdp.FormBorderStyle = FormBorderStyle.None;
            fdp.TopLevel = false;
            fdp.Dock = DockStyle.Fill;
            fdp.ShowInTaskbar = false;
            fdp.Show();

            this.pnl_SubForm.Controls.Add(fdp);
        }


        private void open_frmThongKe()
        {
            this.pnl_SubForm.Controls.Clear();

            frmThongKe fdp = new frmThongKe();
            fdp.FormBorderStyle = FormBorderStyle.None;
            fdp.TopLevel = false;
            fdp.Dock = DockStyle.Fill;
            fdp.ShowInTaskbar = false;
            fdp.Show();

            this.pnl_SubForm.Controls.Add(fdp);
        }

        private void btnBaoCao_Click(object sender, EventArgs e)
        {
            open_frmThongKe();
        }
    }
}

