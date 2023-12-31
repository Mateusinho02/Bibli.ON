<?php
session_start();

if (!isset($_SESSION['idu'])) {
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
    <link rel="stylesheet" type="text/css" href="../css/tela19.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Biblioteca</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            function toggleSidebar() {
                $('.sidebar').toggleClass('show-sidebar');
                $('.sidebar-overlay').toggle();
            }

            $('#termo').keypress(function(event) {
                if (event.which === 13) {
                    event.preventDefault();
                    pesquisarLivros();
                }
            });

            $('.search-btn').click(function(e) {
                e.preventDefault();
                pesquisarLivros();
            });

            $('.dropbtn3').click(function() {
                toggleSidebar();
            });

            $('.dropbtn2').click(function() {
                $('.dropdown-content2').toggle();
            });

            $('.dropbtn1').click(function() {
                $('.dropdown-content1').toggle();
            });

            function desconectarUsuario() {
                $.ajax({
                    type: 'GET',
                    url: 'logout.php',
                    success: function() {
               
                        window.location.href = 'log.php';
                    },
                    error: function() {
                        alert('Erro ao desconectar o usuário');
                    }
                });
            }

    
            window.onunload = function() {
                desconectarUsuario();
            };

        });
    </script>
 <style>
        .message-box {
            position: fixed;
            top: 5%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: #ffffff;
            padding: 10px 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
            font-size: 16px;
            color: #333333;
        }

    </style>
</head>
<body>
    <header>
        <div class="logo">
            <h1 class="sp">Bibli.ON</h1>
        </div>
        <div style="display: flex;">
            <form method="post" id="search-form" class="search-form">
                
                <div class="search-box">
                    <input type="text" name="termo" id="search-txt" class="search-txt" placeholder="Digite aqui...">
                    <a class="search-btn" onclick="submitForm()">
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </a>
                </div>
            </form>
            <div class="search-box2">
                <li class="search-btn2">
                    <a class="fa fa-user dropbtn3" aria-hidden="true"></a>
                </li>
            </div>
        </div>
    </header>
    <nav>
        <ul>
            <li><a href="matematica.php">CLUBE DO LIVRO</a></li>
            <li><a href="biologia.php">MAIS LIDOS</a></li>
            <li>
                <select class="in" name="termo2" required>
                <option value="">Selecione um gênero</option>
                    <?php
                    $generos = array(
                        'Ficção Científica',
                        'Fantasia',
                        'Romance',
                        'Mistério',
                        'Suspense',
                        'Terror/Horror',
                        'Aventura',
                        'Policial',
                        'Histórico',
                        'Biografia',
                        'Autobiografia',
                        'Ficção Histórica',
                        'Literatura Clássica',
                        'Drama',
                        'Comédia',
                        'Poesia',
                        'Ensaio',
                        'Filosofia',
                        'Autoajuda',
                        'Negócios/Empreendedorismo',
                        'Ciências',
                        'Psicologia',
                        'Autoconhecimento',
                        'Religião/Espiritualidade',
                        'Contos',
                        'Crônicas',
                        'Teatro',
                        'Educação',
                        'Viagens',
                        'Culinária',
                        'HQ/Quadrinhos',
                        'Infantojuvenil'
                    );

                    foreach ($generos as $genero) {
                        echo "<option value='$genero'>$genero</option>";
                    }
                    ?>
                </select>
            </li>
            <li>
            <a style="background-color: #c7dde6; border-radius: 5px;"><?php echo obterNumeroLivros(); ?> Livros</a>
            </li>
        </ul>
    </nav>
    <?php
    function obterNumeroLivros()
    {
        $servername = "localhost";
        $username = "root";
        $password = "root";
        $dbname = "biblioteca";

        $conn = new mysqli($servername, $username, $password, $dbname);
        if ($conn->connect_error) {
            die("Falha na conexão com o banco de dados: " . $conn->connect_error);
        }

        $sql = "SELECT COUNT(*) as total FROM livros";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $total = $row["total"];
            return $total;
        }

        $conn->close();
        return 0;
    }
    ?>

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

        if (isset($_POST['termo'])) {
            $termo = $_POST['termo'];
            $sql = "SELECT * FROM livros WHERE titulo LIKE '%$termo%'";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $livroId = $row["id"];
                    $mediaQuery = "SELECT media FROM media_avaliacoes WHERE livro_id = $livroId";
                    $mediaResult = $conn->query($mediaQuery);
                    $media = "N/A";
                    if ($mediaResult && $mediaResult->num_rows > 0) {
                        $mediaRow = $mediaResult->fetch_assoc();
                        $media = $mediaRow['media'];
                    }
                    echo "<a class='txtba' href='detalhes.php?id=" . $row["id"] . "' class='livro-link'>";
                    echo "<div class='livro'>";
                    echo "<img src='" . $row["imagem"] . "' alt='" . $row["titulo"] . "' class='livro-imagem'>";
                    echo "<h3>" . $row["titulo"] . "</h3>";
                    echo "<p>" . $row["genero"] . "</p>";
                    echo "</div>";
                    echo "</a>";
                    echo "<a class='fav-btn' data-livro-id='" . $row["id"] . "'><i class='fa fa-star' aria-hidden='true'></i></a>";
                }
            } else {
                echo "<p>Nenhum livro encontrado.</p>";
            }
        } else {

            $sql = "SELECT * FROM livros";
            $result = $conn->query($sql);
            
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $livroId = $row["id"];
                    echo "<a class='txtba' href='detalhes.php?id=" . $row["id"] . "' class='livro-link'>";
                    echo "<div class='livro'>";
                    echo "<img src='" . $row["imagem"] . "' alt='" . $row["titulo"] . "' class='livro-imagem'>";
                    echo "<h3>" . $row["titulo"] . "</h3>";
                    echo "<p>" . $row["genero"] . "</p>";
                    echo "</div>";
                    echo "</a>";
                    echo "<a class='fav-btn' data-livro-id='" . $row["id"] . "'><i class='fa fa-star' aria-hidden='true'></i></a>";
                }
        } else {
            echo "<p style='padding-left: 20px;'>Nenhum livro encontrado</p>";
        }
        }

        $conn->close();
        ?>
    </div>
    <div class="sidebar">
        <h2><?php echo $nomeUsuario; ?></h2>
        <ul>
            <li><a href="reservados.php">Livros reservados</a></li>
            <li><a href="favoritos.php">Favoritos</a></li>
            <li><a href="logout.php">Sair</a></li>
        </ul>
    </div>

    <script>
        function submitForm() {
            document.getElementById("search-form").submit();
        }

        $(document).ready(function() {
            $('.search-btn2').click(function() {
                toggleSidebar();
            });
        });

        $(document).on('click', '.fav-btn', function() {
    var livroId = $(this).data('livro-id');
    var btnFavorito = $(this);

    $.ajax({
        type: 'POST',
        url: 'adicionar_carrinho.php',
        data: { livroId: livroId },
        success: function(response) {
   
            var messageBox = $('<div class="message-box">' + response + '</div>');

      
            $('body').append(messageBox);

      
            setTimeout(function() {
                messageBox.remove();
            }, 2000);

            
            if (response === 'Livro adicionado aos favoritos') {
             
                btnFavorito.closest('.livro').remove();
            }
        },
        error: function() {
          
            alert('Erro ao adicionar o livro ao favorito.');
        }
    });
});
    </script>
</body>
</html>
