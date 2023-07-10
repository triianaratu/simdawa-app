<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Prodi extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('ProdiModel');
        $this->load->library('Pdf');
    }

    public function index()
    {
        $data['title'] = "Prodi Beasiswa | SIMDAWA-APP";
        $data['prodi'] = $this->ProdiModel->get_prodi();
        $this->load->view('template/header', $data);
        $this->load->view('template/sidebar');
        $this->load->view('prodi/prodi_read', $data);
        $this->load->view('template/footer');
    }

    public function tambah()
    {
        if (isset($_POST['create'])) {
            $this->ProdiModel->insert_prodi();
            redirect('prodi');
        } else {
            $data['title'] = "Tambah Data Prodi Beasiswa | SIMDAWA-APP";
            $this->ProdiModel->get_prodi();
            $this->load->view('template/header', $data);
            $this->load->view('template/sidebar');
            $this->load->view('prodi/prodi_create');
            $this->load->view('template/footer');
        }
    }

    public function ubah($id)
    {
        if (isset($_POST['update'])) {
            $this->ProdiModel->update_prodi();
            redirect('prodi');
        } else {
            $data['title'] = "Perbaharui Data Prodi Beasiswa | SIMDAWA-APP";
            $data['prodi'] = $this->ProdiModel->get_prodi_byid($id);
            $this->load->view('template/header', $data);
            $this->load->view('template/sidebar');
            $this->load->view('prodi/prodi_update', $data);
            $this->load->view('template/footer');
        }
    }

    public function hapus($id)
    {
        if (isset($id)) {
            $this->ProdiModel->delete_prodi($id);
            redirect('prodi');
        }
    }

    public function cetak()
    {
        $data['prodi'] = $this->ProdiModel->get_prodi();
        $this->load->view('prodi/prodi_print', $data);
    }
}
