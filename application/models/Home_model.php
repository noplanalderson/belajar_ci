<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home_model extends CI_Model {

	public function getKontak($id = null)
	{
		if(is_null($id)) 
		{
			$this->db->order_by('nama_lengkap', 'asc');
			return $this->db->get('tb_kontak')->result_array();
		}
		else
		{
			$this->db->where('id_kontak', $id);
			return $this->db->get('tb_kontak')->row_array();
		}
	}

	public function tambah($post)
	{
		return $this->db->insert('tb_kontak', [
			'email' => strtolower($post['email']),
			'nama_lengkap' => strtoupper($post['nama_lengkap']),
			'alamat' => $post['alamat'],
			'no_whatsapp' => $post['no_whatsapp'],
			'kota' => strtoupper($post['kota']),
			'kecamatan' => strtoupper($post['kecamatan']),
			'kode_pos' => $post['kode_pos']
		]) ? true : false;
	}

	public function edit($id, $post)
	{
		$this->db->where('id_kontak', $id);
		$this->db->update('tb_kontak', [
			'email' => strtolower($post['email']),
			'nama_lengkap' => strtoupper($post['nama_lengkap']),
			'alamat' => $post['alamat'],
			'no_whatsapp' => $post['no_whatsapp'],
			'kota' => strtoupper($post['kota']),
			'kecamatan' => strtoupper($post['kecamatan']),
			'kode_pos' => $post['kode_pos']
		]);

		return ($this->db->affected_rows() > 0) ? true : false;
	}

	public function hapusKontak($id)
	{
		$this->db->where('id_kontak', $id);
		$this->db->delete('tb_kontak');

		return ($this->db->affected_rows() > 0) ? true : false;
	}
}

/* End of file home_model.php */
/* Location: ./application/models/home_model.php */