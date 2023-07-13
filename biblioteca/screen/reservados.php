<?php
session_start();

date_default_timezone_set('America/Sao_Paulo');


if (!isset($_SESSION['nomeUsuario'])) {
    header('Location: log.php');
    exit();
}

$nomeUsuario = $_SESSION['nomeUsuario'];
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/reserva2.css">
    <title>Carrinho</title>
</head>
<body>
    <h1 class="logo">Livros reservados</h1>
    <div class="livros-container">
    <?php
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "biblioteca";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Falha na conexão com o banco de dados: " . $conn->connect_error);
        }

        $userId = $_SESSION['idu'];
        $sql = "SELECT livros.*, livros_reservados.*, livros_reservados.multa AS multa_livro FROM livros_reservados INNER JOIN livros ON livros_reservados.livro_id = livros.id WHERE livros_reservados.user_id = $userId";
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            echo "<ul>";
            while ($livro = $result->fetch_assoc()) {
                echo "<div class='livro'>";
                echo "<img class='livro-imagem' src='" . $livro["imagem"] . "' alt='" . $livro["titulo"] . "'>";
                echo "<h3>Título: " . $livro["titulo"] . "</h3>";
                echo "<p>Gênero: " . $livro["genero"] . "</p>";
                
                // Verifica se a data de devolução é anterior à data atual
                $dataDevolucao = $livro["data_devolucao"];
                $dataAtual = date("Y-m-d");
                if ($dataDevolucao < $dataAtual) {
                    // Calcula a multa de R$2
                    $diferencaDias = (strtotime($dataAtual) - strtotime($dataDevolucao));
                    $multa =  2 * date('d',$diferencaDias);;
                    // Calcula a multa com base na diferença de dias;
                    $livroId = $livro["id"];
                    $updateSql = "UPDATE livros_reservados SET multa = $multa WHERE id = $livroId";
                    $conn->query($updateSql);
                    
                    echo "<p>Multa: R$ " . $multa . "</p>";
                }
                echo "</div>";
                
            }
            echo "</ul>";
        } else {
            echo "<p>Nenhum livro reservado.</p>";
        }

        $conn->close();
    ?>
    </div>
</body>
</html>
