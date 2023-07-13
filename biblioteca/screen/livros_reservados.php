<?php
session_start();

date_default_timezone_set('America/Sao_Paulo');

if (!isset($_SESSION['idu'])) {
    header('Location: log.php');
    exit();
}

if (isset($_GET['id'])) {
    $livroId = $_GET['id'];

    // Faça a conexão com o banco de dados
    $servername = "localhost";
    $username = "root";
    $password = "root";
    $dbname = "biblioteca";
    $conn = new mysqli($servername, $username, $password, $dbname);

    // Verifique se a conexão foi bem-sucedida
    if ($conn->connect_error) {
        die("Falha na conexão com o banco de dados: " . $conn->connect_error);
    }

    // Obtenha o ID do usuário atual
    $userId = $_SESSION['idu'];

    // Verifique se a quantidade do livro é igual a 0
    $verificarQuantidadeQuery = "SELECT disponivel FROM livros WHERE id = $livroId";
    $verificarQuantidadeResult = $conn->query($verificarQuantidadeQuery);

    // Verifique se a consulta retornou algum resultado
    if ($verificarQuantidadeResult && $verificarQuantidadeResult->num_rows > 0) {
        $livro = $verificarQuantidadeResult->fetch_assoc();
        $disponivel = $livro['disponivel'];

        if ($disponivel == 0) {
            // O livro não está disponível (quantidade = 0)
            $livroDisponivel = false; // Defina como false para exibir a mensagem "Livro não disponível"
        } else {
            // Verifique se o livro já foi reservado pelo usuário
            $verificarReservaQuery = "SELECT * FROM livros_reservados WHERE livro_id = $livroId AND user_id = $userId";
            $verificarReservaResult = $conn->query($verificarReservaQuery);

            // Verifique se a consulta retornou algum resultado
            if ($verificarReservaResult && $verificarReservaResult->num_rows > 0) {
                // O livro já foi reservado pelo usuário
                $livroReservado = false; // Defina como false para exibir a mensagem "Livro já reservado"
            } else {

                // Inicie a atualização da quantidade do livro na tabela livros
                $updateQuery = "UPDATE livros SET disponivel = disponivel - 1 WHERE id = $livroId";
                $updateResult = $conn->query($updateQuery);

                // Verifique se a atualização foi bem-sucedida
                if ($updateResult) {
                    // Insira o livro reservado na tabela livros_reservados, incluindo a data de reserva
                    // Insira o livro reservado na tabela livros_reservados, incluindo a data de reserva e a data de devolução
                    $dataReserva = date('Y-m-d');
                    $dataDevolucao = date('Y-m-d', strtotime($dataReserva . ' + 15 days'));
                    $insertQuery = "INSERT INTO livros_reservados (livro_id, user_id, data_reserva, data_devolucao) VALUES ($livroId, $userId, '$dataReserva', '$dataDevolucao')";


                    $insertResult = $conn->query($insertQuery);

                    // Verifique se a reserva foi bem-sucedida
                    if ($insertResult) {
                        $livroReservado = true; // Defina como true se a reserva for bem-sucedida
                    } else {
                        $livroReservado = false; // Defina como false para exibir a mensagem de erro
                        echo "Erro ao reservar o livro. Por favor, tente novamente.";
                    }
                } else {
                    $livroReservado = false; // Defina como false para exibir a mensagem de erro
                }
            }
        }
    } else {
        // Livro não encontrado
        $livroDisponivel = false;
    }

    // Defina as variáveis de sessão correspondentes ao status da reserva do livro e disponibilidade do livro
    $_SESSION['livro_reservado'] = $livroReservado;
    $_SESSION['livro_disponivel'] = $livroDisponivel;

    header("Location: detalhes.php?id=$livroId");
    exit();

    $conn->close();
}
?>
