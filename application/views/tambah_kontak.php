  	<div class="container">
	    <h1 class="mt-4">Silakan Isi Data Anda</h1>

	    <?php echo ($this->session->flashdata('pesan') ?? null); ?>
	    
		<?php echo form_open('', 'method="post"'); ?>

		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputEmail4">Email</label>
		      <input type="email" name="email" class="form-control" id="inputEmail4" required>
		    </div>
		    
		    <div class="form-group col-md-6">
		      <label for="nama_lengkap">Nama Lengkap</label>
		      <input type="text" name="nama_lengkap" class="form-control" id="nama_lengkap" required>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="no_whatsapp">No. Whatsapp</label>
		    <input type="text" name="no_whatsapp" class="form-control" id="no_whatsapp" placeholder="No. Whatsapp" required>
		  </div>

		  <div class="form-group">
		    <label for="inputAddress2">Alamat</label>
		    <input type="text" name="alamat" class="form-control" id="inputAddress2" placeholder="Alamat" required>
		  </div>
		  
		  <div class="form-row">
		    <div class="form-group col-md-6">
		      <label for="inputCity">Kota</label>
		      <input type="text" name="kota" class="form-control" value="Kota Tangerang" id="inputCity" readonly="">
		    </div>

		    <div class="form-group col-md-4">
		      <label for="inputState">Kecamatan</label>
		      <select id="inputState" name="kecamatan" class="form-control" required>
		        <option value="" selected>Pilih...</option>
		        <option value="Kecamatan Karawaci">Kecamatan Karawaci</option>
		        <option value="Kecamatan Benda">Kecamatan Benda</option>
		        <option value="Kecamatan Pinang">Kecamatan Pinang</option>
		        <option value="Kecamatan Periuk">Kecamatan Periuk</option>
		        <option value="Kecamatan Ciledug">Kecamatan Ciledug</option>
		        <option value="Kecamatan Larangan">Kecamatan Larangan</option>
		        <option value="Kecamatan Cipondoh">Kecamatan Cipondoh</option>
		        <option value="Kecamatan Karang Tengah">Kecamatan Karang Tengah</option>
		        <option value="Kecamatan Tangerang">Kecamatan Tangerang</option>
		        <option value="Kecamatan Batuceper">Kecamatan Batuceper</option>
		        <option value="Kecamatan Neglasari">Kecamatan Neglasari</option>
		        <option value="Kecamatan Cibodas">Kecamatan Cibodas</option>
		        <option value="Kecamatan Jatiuwung">Kecamatan Jatiuwung</option>
		      </select>
		    </div>

		    <div class="form-group col-md-2">
		      <label for="inputZip">Kode Pos</label>
		      <input type="text" name="kode_pos" class="form-control" id="inputZip">
		    </div>
		  </div>
		  <!-- <div class="form-group">
		    <div class="form-check">
		      <input class="form-check-input" type="checkbox" id="gridCheck">
		      <label class="form-check-label" for="gridCheck">
		        Check me out
		      </label>
		    </div>
		  </div> -->
		  <button type="submit" name="kirim" class="btn btn-primary">Kirim</button>
		</form>
	</div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
  </body>
</html>