<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		is_login();
	}

	public function index()
	{
		$data = array(
			'title' => 'Login'
		);
		$this->load->view('template/head', $data);
		$this->load->view('login_view', $data);
	}

	public function auth()
	{
		$this->load->model('login_model');
		$username = $this->input->post('username', TRUE);
		$password = $this->input->post('password', TRUE);

		// Ambil data sesuai dengan username yang diinput
		$dataUser = $this->login_model->getUser($username);
		
		// Cek ketersediaan User dalam database
		if(count($dataUser) > 0)
		{
			// Validasi Password
			if(password_verify($password, $dataUser['password']))
			{
				// Jika password benar
				// Maka buat session
				$array = array(
					'user_id' => $dataUser['user_id'],
					'level_id' => $dataUser['level_id'],
					'nama' => $dataUser['nama']
				);
				
				$this->session->set_userdata( $array );
				// Alihkan ke halaman home
				redirect('home');
			}
			else
			{
				// Jika password salah
				// Buat flash message
				$this->session->set_flashdata('login_msg', 'Password Salah!');
				//Kembalikan ke halaman login
				redirect('login');
			}
		}
		else
		{
			// Jika username tidak ada
			// Buat flash message
			$this->session->set_flashdata('login_msg', 'Username tidak terdaftar!');
			//Kembalikan ke halaman login
			redirect('login');
		}
	}
}
/* End of file login.php */
/* Location: ./application/controllers/login.php */