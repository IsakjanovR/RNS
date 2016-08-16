<head>
    <link rel="stylesheet" href="css/style.css">
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="js/app.js"></script>
</head>
<?php
include_once "connect.php";
include_once "function.php";
?>
<div class="main">
    <form action="" method="post">
        <div class="select_qual">
            <h2>Обраование </h2>
            <select class="qualification" name="qualification[]" multiple="multiple">
                <?php
                foreach ($arrQualification as $rowQualification) : ?>
                    <option
                        value="<?php echo $rowQualification['id']; ?>"><?php echo($rowQualification['name']); ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="select_city">
            <h2>Города</h2>
            <select class="city" name="City[]" multiple="multiple">
                <?php foreach ($arrCity as $rowCity) : ?>
                    <option value="<?php echo $rowCity['id']; ?>"><?php echo($rowCity['city_name']); ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <input class="button" type="submit" value="Отобразить">
    </form>
    <div id="window_show">

        <?php

        if (isset ($_POST['qualification']) && isset($_POST['City'])) {
            foreach ($_POST['City'] as $value)
                $in1[] = $value . "\n";
            foreach ($_POST['qualification'] as $value)
                $in2[] = $value . "\n";
            $result = mysqli_query($db, "SELECT * FROM `users` INNER JOIN `users_city` ON users_city.user_id = users.id AND users_city.city_id IN (" . implode(',', $in1) . ") INNER JOIN city ON city.id = users_city.city_id INNER JOIN `qualification` ON qualification.id = users.qualification_id AND users.qualification_id IN (" . implode(',', $in2) . ")");
            if (mysqli_num_rows($result) > 0) {
                $arr = array();
                while ($row = mysqli_fetch_array($result)) {
                    $arr[] = $row;
                }
                mysqli_free_result($result);
                echo "<table>";
                echo "<thead> <tr><th>Ф.И.О.</th><th>Образование</th><th>Город</th></tr> </thead><tbody>";
                foreach ($arr as $row) :
                    echo "<tr>";
                    echo "<td>" . $row['users_name'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['city_name'] . "</td>";
                    echo "</tr>";
                endforeach;
                echo "</tbody></table>";
            } else {
                echo "Пользователей в этом городе и с указанным образованием не найдено";
            }


        } elseif (isset($_POST['City'])) {
            foreach ($_POST['City'] as $value)
                $in[] = $value . "\n";
            $result = mysqli_query($db, "SELECT * FROM `users` INNER JOIN `users_city` ON users_city.user_id = users.id AND users_city.city_id IN (" . implode(',', $in) . ") INNER JOIN city ON city.id = users_city.city_id INNER JOIN `qualification` ON qualification.id = users.qualification_id");
            if (mysqli_num_rows($result) > 0) {
                $arr = array();
                while ($row = mysqli_fetch_array($result)) {
                    $arr[] = $row;
                }
                mysqli_free_result($result);
                echo "<table>";
                echo "<thead> <tr><th>Ф.И.О.</th><th>Образование</th><th>Город</th></tr> </thead><tbody>";
                foreach ($arr as $row) :
                    echo "<tr>";
                    echo "<td>" . $row['users_name'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['city_name'] . "</td>";
                    echo "</tr>";
                endforeach;
                echo "</tbody></table>";
            } else {
                echo "Пользователей в этом городе не найдено";
            }
        } elseif (isset($_POST['qualification'])) {
            foreach ($_POST['qualification'] as $value)
                $in[] = $value . "\n";
            $result = mysqli_query($db, "SELECT * FROM `users` INNER JOIN qualification ON qualification.id = users.qualification_id AND users.qualification_id IN (" . implode(',', $in) . ") INNER JOIN users_city ON users_city.user_id = users.id INNER JOIN city ON city.id = users_city.city_id");
            if (mysqli_num_rows($result) > 0) {

                $arr = array();
                while ($row = mysqli_fetch_array($result)) {
                    $arr[] = $row;
                }
                mysqli_free_result($result);
                echo "<table>";
                echo "<thead> <tr><th>Ф.И.О.</th><th>Образование</th><th>Город</th></tr> </thead><tbody>";
                foreach ($arr as $row) :
                    echo "<tr>";
                    echo "<td>" . $row['users_name'] . "</td>";
                    echo "<td>" . $row['name'] . "</td>";
                    echo "<td>" . $row['city_name'] . "</td>";
                    echo "</tr>";
                endforeach;
                echo "</tbody></table>";
            } else {
                echo "Пользоватей с таким образованием не найдено";
            }
        }

        ?>
    </div>
</div>





