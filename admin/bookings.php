<?php

include '../components/connect.php';

if(isset($_COOKIE['admin_id'])){
   $admin_id = $_COOKIE['admin_id'];
}else{
   $admin_id = '';
   header('location:login.php');
}

if(isset($_POST['delete'])){

   $delete_id = $_POST['delete_id'];
   $delete_id = filter_var($delete_id, FILTER_SANITIZE_STRING);

   $verify_delete = mysqli_prepare($conn, "SELECT * FROM `bookings` WHERE id = ?");
   mysqli_stmt_bind_param($verify_delete, 's', $delete_id);
   mysqli_stmt_execute($verify_delete);
   $result = mysqli_stmt_get_result($verify_delete);

   if(mysqli_num_rows($result) > 0){
      $delete_bookings = mysqli_prepare($conn, "DELETE FROM `bookings` WHERE id = ?");
      mysqli_stmt_bind_param($delete_bookings, 's', $delete_id);
      mysqli_stmt_execute($delete_bookings);
      $success_msg[] = 'Booking deleted!';
   }else{
      $warning_msg[] = 'Booking already deleted!';
   }

}

?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Bookings</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="../css/admin_style.css">

</head>
<body>
   
<!-- header section starts  -->
<?php include '../components/admin_header.php'; ?>
<!-- header section ends -->

<!-- bookings section starts  -->

<section class="grid">

   <h1 class="heading">bookings</h1>

   <div class="box-container">

   <?php
      $select_bookings = mysqli_query($conn, "SELECT * FROM `bookings`");
      if(mysqli_num_rows($select_bookings) > 0){
         while($fetch_bookings = mysqli_fetch_assoc($select_bookings)){
   ?>
   <div class="box">
      <p>booking id : <span><?= $fetch_bookings['id']; ?></span></p>
      <p>name : <span><?= $fetch_bookings['name']; ?></span></p>
      <p>email : <span><?= $fetch_bookings['email']; ?></span></p>
      <p>number : <span><?= $fetch_bookings['number']; ?></span></p>
      <p>check in : <span><?= $fetch_bookings['check_in']; ?></span></p>
      <p>check out : <span><?= $fetch_bookings['check_out']; ?></span></p>
      <p>rooms : <span><?= $fetch_bookings['rooms']; ?></span></p>
      <p>adults : <span><?= $fetch_bookings['adults']; ?></span></p>
      <p>childs : <span><?= $fetch_bookings['childs']; ?></span></p>
      <form action="" method="POST">
         <input type="hidden" name="delete_id" value="<?= $fetch_bookings['id']; ?>">
         <input type="submit" value="delete booking" onclick="return confirm('delete this booking?');" name="delete" class="btn">
      </form>
   </div>
   <?php
         }
      }else{
   ?>
   <div class="box" style="text-align: center;">
      <p>no bookings found!</p>
      <a href="dashboard.php" class="btn">go to home</a>
   </div>
   <?php
      }
   ?>

   </div>

</section>

<!-- bookings section ends -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<!-- custom js file link  -->
<script src="../js/admin_script.js"></script>

<?php include '../components/message.php'; ?>

</body>
</html>
