<?php
session_start();
include('connection.php');

//admin authentication
if (!isset($_SESSION['user']) || !isset($_SESSION['admin'])) {
    echo "<script>alert('Please login to continue!')</script>";
    echo '<script>window.location="login.php"</script>';
} else if ($_SESSION['admin'] == 0) {
    echo "<script>alert('Please login to continue')</script>";
    echo '<script>window.location="login.php"</script>';
}

$shipping_info_query = "SELECT * FROM shipping_info";
$result = $connection->query($shipping_info_query);


?>
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Admin Panel</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="assets/css/style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Favicons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
</head>
<body>
<!--
	Upper Header Section
-->
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="topNav">
        <div class="container">
            <div class="alignR">
                
                <a href="index.php"> <span class="icon-home"></span> Home</a>
                <a href="login.php"><span class="icon-edit"></span> Free Register </a>
                <a href="logout.php"><?php if (isset($_SESSION['user'])) echo "Logout"; ?></a>
                <a href="cart.php"><span class="icon-shopping-cart"></span> <?php if (isset($_SESSION["cart"]))
                        echo count($_SESSION["cart"]); ?> Item(s)</a>
            </div>
        </div>
    </div>
</div>

<!--
Lower Header Section
-->
<div class="container">
    <div id="gototop"></div>
    <header id="header">
        <div class="row">
            <div class="span4">
                <h1>
                    <a class="logo" href="index.php"><span>Twitter Bootstrap ecommerce template</span>
                        <img src="assets/img/logo-bootstrap-shoping-cart.png" alt="bootstrap sexy shop">
                    </a>
                </h1>
            </div>

            <div class="span8 alignR">
                <p><br> <strong> Contact : 01785220685 </strong><br><br></p>
                <span class="btn btn-mini">[ <?php if (isset($_SESSION["cart"]))
                        echo count($_SESSION["cart"]); ?> ] <span
                            class="icon-shopping-cart"></span></span>
                <span class="btn btn-warning btn-mini">$</span>
            </div>
        </div>
    </header>

    <!--
    Navigation Bar Section
    -->
    <div class="navbar">
        <div class="navbar-inner">
            <div class="container">
                <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <div class="nav-collapse">
                    <ul class="nav">
                        <li class=""><a href="index.php">Home </a></li>
                    </ul>
                    <form action="search.php" method="post" class="navbar-search pull-right">
                        <input type="text" name="search_name" placeholder="Search" class="search-query span2">
                    </form>
                    <ul class="nav pull-right">
                        <li class="dropdown">
                            <a href="login.php"> Login </a>

                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--
    Body Section
    -->
    <div class="row">

        <div class="span12">
            <ul class="breadcrumb">
                <li><a href="index.php">Home</a> <span class="divider">/</span></li>
                <li class="active">Admin Panel</li>
            </ul>
            <h3> Shipping History</h3>
            <hr class="soft"/>

            <div class="row">
                <div class="span4"></div>
                <div class="span6">
                    <div class="well">
                        <h5>Add items</h5><br/>
                        Fill all the fields to add items<br/><br/><br/>
                        <form action="upload.php" method="post" enctype="multipart/form-data">
                            <div class="control-group">
                                <label class="control-label" for="inputEmail">Product Name</label>
                                <div class="controls">
                                    <input type="text" name="product_name">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputEmail">Price</label>
                                <div class="controls">
                                    <input type="text" name="price">
                                </div>
                            </div>
                            <div class="control-group">
                                <label class="control-label" for="inputEmail">Quantity</label>
                                <div class="controls">
                                    <input type="text" name="quantity">
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label" for="inputEmail">Image</label>
                                <div class="controls">
                                    <input type="file" name="fileToUpload" id="fileToUpload">
                                </div>
                            </div>

                            <div class="controls">
                                <button type="submit" name="submit" class="btn block">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="span1"> &nbsp;</div>

            </div>

            <h3> Shipping information</h3>
            <hr class="soft"/>

            <div class="row">
                <div class="span12">

                    <table class="table table-bordered table-condensed">
                        <thead>
                        <th>Voucher No</th>
                        <th>Username</th>
                        <th>Shipping Address</th>
                        <th>Zipcode</th>
                        <th>Total price</th>
                       
                        <th>DateTime</th>
                        </thead>
                        <tbody>
                        <?php while ($row = $result->fetch_assoc()) {

                            $temp_user = $row['username'];
                            //getting user information
                            $user_query = "SELECT * FROM user_information where username = '$temp_user'";
                            $user = $connection->query($user_query)->fetch_assoc();

                            $id = $row['id'];
                            echo "<tr><td><a href='show_voucher_information.php?id=$id'>$id</a></td>";
                            echo "<td>" . $row['username'] . "</td>";
                            echo "<td>" . $user['full_address'] . "</td>";
                            echo "<td>" . $user['zipcode'] . "</td>";
                            echo "<td>" . $row['total_money'] . "</td>";
                            
                            echo "<td>" . $row['order_time'] . "</td>";
                            echo "</tr>";

                        }
                        ?>
                        </tbody>
                    </table>

                </div>
                <div class="span1"> &nbsp;</div>

            </div>
            <div class="span12">


            </div>
        </div>
    </div>

</div>



</body>
</html>
