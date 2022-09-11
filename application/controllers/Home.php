<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		validasi_login();

		$this->load->model('home_model');
	}

	public function index()
	{
		$data = array(
			'kontak' => $this->home_model->getKontak(),
			'title' => 'Home'
		);

		$this->load->view('template/head', $data);
		$this->load->view('template/navbar');
		$this->load->view('home', $data);

	}

	private function __rules()
	{
		$rules = array(
			array(
				'field' => 'nama_lengkap',
				'label' => 'Nama Lengkap',
				'rules' => 'required|alpha_numeric_spaces|min_length[5]|max_length[50]',
				'errors'=> array(
					'required' => '{field} wajib diisi.',
					'alpha_numeric_spaces' => '{field} hanya boleh mengandung karakter alfanumerik dan spasi',
					'min_length' => 'Panjang minimal {field} 5 karakter',
					'max_length' => 'Panjang maksimal {field} 50 karakter',
				)
			),
			array(
				'field' => 'alamat',
				'label' => 'Alamat',
				'rules' => 'required|regex_match[/[a-zA-Z0-9 \/\-,.]+$/]|min_length[5]|max_length[250]',
				'errors'=> array(
					'required' => '{field} wajib diisi.',
					'regex_match' => '{field} hanya boleh mengandung karakter [a-zA-Z0-9 /-,.]',
					'min_length' => 'Panjang minimal {field} 5 karakter',
					'max_length' => 'Panjang maksimal {field} 250 karakter',
				)
			),
			array(
				'field' => 'kota',
				'label' => 'Kota',
				'rules' => 'required|alpha_numeric_spaces|min_length[5]|max_length[50]',
				'errors'=> array(
					'required' => '{field} wajib diisi.',
					'alpha_numeric_spaces' => '{field} hanya boleh mengandung karakter alfanumerik dan spasi',
					'min_length' => 'Panjang minimal {field} 5 karakter',
					'max_length' => 'Panjang maksimal {field} 50 karakter',
				)
			),
			array(
				'field' => 'kecamatan',
				'label' => 'Kecamatan',
				'rules' => 'required|alpha_numeric_spaces|min_length[5]|max_length[50]',
				'errors'=> array(
					'required' => '{field} wajib diisi.',
					'alpha_numeric_spaces' => '{field} hanya boleh mengandung karakter alfanumerik dan spasi',
					'min_length' => 'Panjang minimal {field} 5 karakter',
					'max_length' => 'Panjang maksimal {field} 50 karakter',
				)
			),
			array(
				'field' => 'kode_pos',
				'label' => 'Kode POS',
				'rules' => 'required|integer|exact_length[5]',
				'errors'=> array(
					'required' => '{field} wajib diisi.',
					'integer' => '{field} hanya boleh mengandung angka',
					'exact_length' => 'Panjang minimal {field} 5 karakter'
				)
			)
		);

		return $rules;
	}

	public function tambah()
	{
		if(isset($_POST['kirim']))
		{
			$post = $this->input->post(null, TRUE);	

			$this->form_validation->set_rules($this->__rules());
			$this->form_validation->set_rules(array(
				array(
					'field' => 'email',
					'label' => 'Email',
					'rules' => 'required|valid_email|max_length[100]|is_unique[tb_kontak.email]',
					'errors'=> array(
						'required' => '{field} wajib diisi.',
						'valid_email' => '{field} tidak valid.',
						'max_length' => 'Panjang maksimal {field} 100 karakter',
						'is_unique' => '{field} sudah ada.'
					)
				),
				array(
					'field' => 'no_whatsapp',
					'label' => 'No. Whatsapp',
					'rules' => 'required|numeric|max_length[13]|min_length[11]|is_unique[tb_kontak.no_whatsapp]',
					'errors'=> array(
						'required' => '{field} wajib diisi.',
						'numeric' => '{field} hanya boleh mengandung angka',
						'min_length' => 'Panjang minimal {field} 11 karakter',
						'max_length' => 'Panjang minimal {field} 13 karakter',
						'is_unique' => '{field} sudah ada.'
					)
				)
			));

			if ($this->form_validation->run() === TRUE) 
			{
				$submit = $this->home_model->tambah($post);

				if($submit === true)
				{
					$pesan = '<div class="alert alert-success" role="alert">Data Berhasil Disimpan.</div>';
				}
				else
				{
					$pesan = '<div class="alert alert-danger" role="alert">Data Gagal Disimpan.</div>';
				}
			}
			else
			{
				$pesan = '<div class="alert alert-danger" role="alert">'.validation_errors().'</div>';
			}

			$this->session->set_flashdata('pesan', $pesan);
			redirect('tambah-kontak','refresh');
		}
		else
		{
			$data = array(
				'title' => 'Tambah Kontak'
			);

			$this->load->view('template/head', $data);
			$this->load->view('template/navbar');
			$this->load->view('tambah_kontak');
		}
	}

	public function edit($id)
	{
		$kontak = $this->home_model->getKontak($id);

		if(empty($kontak)) show_404();

		if(isset($_POST['kirim']))
		{
			$post = $this->input->post(null, TRUE);	

			$submit = $this->home_model->edit($id, $post);

			if($submit === true)
			{
				$pesan = '<div class="alert alert-success" role="alert">Data Berhasil Disimpan.</div>';
			}
			else
			{
				$pesan = '<div class="alert alert-danger" role="alert">Data Gagal Disimpan.</div>';
			}

			$this->session->set_flashdata('pesan', $pesan);
			redirect('edit-kontak/'.$id,'refresh');
		}
		else
		{
			$data = array(
				'title' => 'Edit Kontak',
				'kontak'=> $kontak
			);

			$this->load->view('template/head', $data);
			$this->load->view('template/navbar');
			$this->load->view('edit_kontak');
		}	
	}

	public function hapus($id)
	{
		if($this->home_model->hapusKontak($id) === true)
		{
			$pesan = '<div class="alert alert-success" role="alert">Data Berhasil Dihapus.</div>';
		}
		else
		{
			$pesan = '<div class="alert alert-danger" role="alert">Data Gagal Dihapus.</div>';
		}

		$this->session->set_flashdata('pesan', $pesan);
		redirect('home');
	}
}
