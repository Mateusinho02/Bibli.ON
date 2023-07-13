<?php
session_start();

if (!isset($_SESSION['idi'])) {
    header('Location: ../screen/log.php');
    exit();
}

?>

<?php
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "biblioteca";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Falha na conexão com o banco de dados: " . $conn->connect_error);
    }

    $id = $_GET['id'];

    $sql = "SELECT * FROM pessoas WHERE id = '$id'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $nome = $row["nome"];
        $user = $row["user"];
        $email = $row["email"];
        $senha = $row["senha"];
    }

    $sql_update = "UPDATE pessoas SET nome = '$nome', user = '$user', email = '$email', senha = '$senha' WHERE id = '$id'";
    
    // Fechar a conexão com o banco de dados
    $conn->close();
?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/gerenciar.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Biblioteca</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .pagination {
            margin-top: 10px;
        }

        .pagination a {
            display: inline-block;
            padding: 8px 16px;
            text-decoration: none;
            color: #0081B8;
            border: 1px solid #0081B8;
            margin-right: 5px;
        }

        .pagination a.active {
            background-color: #0081B8;
            color: white;
        }

        .pagination2 {
            margin-top: 10px;
        }

        .pagination2 a {
            display: inline-block;
            padding: 8px 16px;
            text-decoration: none;
            color: #0081B8;
            border: 1px solid #0081B8;
            margin-right: 5px;
        }

        .pagination2 a.active {
            background-color: #0081B8;
            color: white;
        }
    </style>
</head>
<body>
    <header>
        <nav class="navigation">
            <div>
                <h3>Bibli.ON</h3>
            </div>
            <div>
                <a href="menuadm.php">Detalhes</a>
                <a style="background-color: #c5deff;" href="menuadm.php">Gerenciar usuários</a>
                <a href="addlivro.php">Adicionar livro</a>
            </div>
        </nav>
    </header>
    <div>
        <div class="usuarios">
            <div class="container-edit">

                
        <h2 style="margin-right: 80px; margin-left: 20px;">Editar</h2>
        <form method="POST" action="detalhesadm.php?id=<?php echo $id; ?>" enctype="multipart/form-data">
            <label for="titulo">Nome</label><br>
            <input class="in" type="text" name="nome" value="<?php echo $nome; ?>" required><br>

            <label for="autor">User</label><br>
            <input class="in" type="text" name="user" value="<?php echo $user; ?>" required><br>

            <label for="quantidade">Email</label><br>
            <input class="in" type="text" name="email" value="<?php echo $email; ?>" required><br>

            <label for="genero">Senha</label><br>
            <input class="in" type="text" name="senha" value="<?php echo $senha; ?>" required><br>

            <button class="lin" type="submit">Editar</button>
        </form>
    </div>
    <div>
    </div>
</body>
</html>