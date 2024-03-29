﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using QUANLYKHACHSAN_PHANTAN.KhachHang_Wcf;

namespace QUANLYKHACHSAN_PHANTAN
{
    public partial class frmQLKhachHang : Form
    {
        public frmQLKhachHang()
        {
            InitializeComponent();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            DialogResult ds = MessageBox.Show("Thoát Quản Lý Khách Hàng ?", "THOÁT", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

            if (ds == DialogResult.Yes)
            {
                this.Close();
            }
            else
            {
                return;
            }
        }

        private void txtTimKiem_Enter(object sender, EventArgs e)
        {
            txtTimKiem.ForeColor = Color.Black;
            txtTimKiem.Clear();
        }

        private void frmQLKhachHang_Load(object sender, EventArgs e)
        {
            btnReload.Image = imgs_Button.Images[0];

            KhachHang_WCFClient kh_wcf = new KhachHang_WCFClient();
            List<KhachHang_Ent> dsKH = kh_wcf.GetKhachHangs().ToList();
            Loading_DSKH(DataTable_DSKH(dsKH));
            Custom_DataGridView(dgv_DSKhachHang);       
        }

        public void Loading_DSKH(DataTable dt)
        {
            dgv_DSKhachHang.Columns.Clear();
            BindingSource bs = new BindingSource();
            bs.DataSource = dt;
            bn_DSKhachHang.BindingSource = bs;
            dgv_DSKhachHang.DataSource = bs;
        }

        public DataTable DataTable_DSKH(List<KhachHang_Ent> dsKhachHang)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("STT", typeof(int));
            dt.Columns.Add("Họ và Tên", typeof(string));
            dt.Columns.Add("Giới Tính", typeof(string));
            dt.Columns.Add("Ngày Sinh", typeof(DateTime));
            dt.Columns.Add("Số CMND", typeof(string));
            dt.Columns.Add("Số Điện Thoại", typeof(string));
            dt.Columns.Add("Quốc Gia", typeof(string));

            int stt = 1;
            foreach (KhachHang_Ent kh_ent in dsKhachHang)
            {
                dt.Rows.Add(stt, kh_ent.Ho + " " + kh_ent.Ten, kh_ent.Gioi_tinh, kh_ent.Date_of_birth, kh_ent.So_cmnd, kh_ent.Sodienthoai, kh_ent.Quoc_tich);
                stt++;
            }

            return dt;
        }

        public void Custom_DataGridView(DataGridView dgv)
        {

            foreach (DataGridViewColumn column in dgv.Columns)
            {
                column.DefaultCellStyle.Font = new Font("Segoe UI", 10);
                column.HeaderCell.Style.Font = new Font("Segoe UI Semibold", 12);

                if (column.Index == 0)
                {
                    column.Width = 42;
                }
                if (column.Index == 1)
                {
                    column.Width = 200;
                }
                if (column.Index == 2)
                {
                    column.Width = 100;
                }
                if (column.Index == 3)
                {
                    column.Width = 120;
                }
                if (column.Index == 4)
                {
                    column.Width = 120;
                }
                if (column.Index == 5)
                {
                    column.Width = 140;
                }
                if (column.Index == 6)
                {
                    column.Width = 220;
                }
            }

            dgv.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;

        }

        private void btnThemKH_Click(object sender, EventArgs e)
        {
            frmTextKhachHang frm = new frmTextKhachHang(this, "Thêm Khách Hàng");
            frm.ShowDialog();
        }

        private void btnSuaKH_Click(object sender, EventArgs e)
        {
            if (dgv_DSKhachHang.SelectedRows.Count == 1)
            {
                KhachHang_WCFClient kh_wcf = new KhachHang_WCFClient();
                KhachHang_Ent kh = kh_wcf.GetKhachHang_byCMND(dgv_DSKhachHang.SelectedRows[0].Cells[4].Value.ToString().Trim());
                frmTextKhachHang frm = new frmTextKhachHang(this, "Sửa Khách Hàng", kh);
                frm.ShowDialog();
            }
            else
            {
                MessageBox.Show("Chọn 1 Nhân Viên Cần Sửa", "", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                return;
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            if (txtTimKiem.Text.Trim() == "")
            {
                return;
            }
            else
            {
                KhachHang_WCFClient kh_wcf = new KhachHang_WCFClient();
                List<KhachHang_Ent> dsKhachHang = kh_wcf.TimKiem_KhachHang_by_CMND(txtTimKiem.Text.Trim()).ToList();
                Loading_DSKH(DataTable_DSKH(dsKhachHang));
                Custom_DataGridView(dgv_DSKhachHang);
            }
        }

        private void btnReload_Click(object sender, EventArgs e)
        {
            KhachHang_WCFClient kh_wcf = new KhachHang_WCFClient();
            List<KhachHang_Ent> dsKhachHang = kh_wcf.GetKhachHangs().ToList();
            Loading_DSKH(DataTable_DSKH(dsKhachHang));
            Custom_DataGridView(dgv_DSKhachHang);
        }
    }
}
