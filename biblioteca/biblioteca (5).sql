-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 12-Jul-2023 às 11:12
-- Versão do servidor: 5.6.20-log
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm`
--

CREATE TABLE IF NOT EXISTS `adm` (
`id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `codigo` int(11) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Extraindo dados da tabela `adm`
--

INSERT INTO `adm` (`id`, `nome`, `usuario`, `email`, `codigo`, `senha`) VALUES
(56, 'asdasd', 'ziliotto', 'gabrielziliotto7@gmail.com', 123123, '123123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `avaliacoes`
--

CREATE TABLE IF NOT EXISTS `avaliacoes` (
`id` int(11) NOT NULL,
  `livro_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `avaliacao` int(11) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Extraindo dados da tabela `avaliacoes`
--

INSERT INTO `avaliacoes` (`id`, `livro_id`, `user_id`, `avaliacao`) VALUES
(1, 31, 1, 1),
(2, 29, 1, 5),
(3, 27, 1, 4),
(4, 27, 4, 1),
(5, 44, 1, 3),
(6, 42, 1, 3),
(7, 43, 1, 4),
(8, 67, 11, 2),
(9, 83, 11, 2),
(10, 77, 44, 1),
(11, 74, 44, 2),
(12, 67, 44, 3),
(13, 75, 47, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carrinho`
--

CREATE TABLE IF NOT EXISTS `carrinho` (
`id` int(11) NOT NULL,
  `id_livro` int(10) unsigned NOT NULL,
  `id_pessoa` int(10) unsigned NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Extraindo dados da tabela `carrinho`
--

INSERT INTO `carrinho` (`id`, `id_livro`, `id_pessoa`) VALUES
(19, 27, 1),
(3, 26, 4),
(16, 25, 1),
(6, 31, 4),
(17, 25, 5),
(20, 31, 1),
(21, 28, 1),
(22, 67, 11),
(23, 72, 11),
(24, 72, 38),
(25, 76, 38),
(27, 83, 44),
(32, 72, 44),
(33, 86, 44),
(30, 69, 44),
(31, 70, 44);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clublivro`
--

CREATE TABLE IF NOT EXISTS `clublivro` (
`id` int(11) NOT NULL,
  `id_livro` varchar(255) NOT NULL,
  `id_turma` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Extraindo dados da tabela `clublivro`
--

INSERT INTO `clublivro` (`id`, `id_livro`, `id_turma`) VALUES
(29, 'Amar Ã© relativo', 'turma 2'),
(30, 'Eu E Esse Meu CoraÃ§Ã£o', 'turma 2'),
(31, 'Amar Ã© relativo', 'turma 2'),
(27, 'A HipÃ³tese do Amor', 'turma 1'),
(26, 'Amar Ã© relativo', 'turma 1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros`
--

CREATE TABLE IF NOT EXISTS `livros` (
`id` int(11) unsigned NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `autor` varchar(255) NOT NULL,
  `quantidade` int(200) NOT NULL,
  `disponivel` int(11) NOT NULL,
  `descricao` text,
  `genero` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=93 ;

--
-- Extraindo dados da tabela `livros`
--

INSERT INTO `livros` (`id`, `titulo`, `autor`, `quantidade`, `disponivel`, `descricao`, `genero`, `imagem`) VALUES
(67, 'A HipÃ³tese do Amor', 'Ali Hazelwood ', 1, 0, 'Olive Smith, aluna do doutorado em Biologia da Universidade Stanford, acredita na ciÃªncia â€“ nÃ£o em algo incontrolÃ¡vel como o amor. Depois de sair algumas vezes com Jeremy, ela percebe que sua melhor amiga gosta dele e decide juntÃ¡-los. Para mostrar que estÃ¡ feliz com essa escolha, Olive precisa ser convincente. Ela resolve inventar um namoro de mentira e, num momento de pÃ¢nico, beija o primeiro homem que vÃª pela frente. O problema Ã© que esse homem Ã© Adam Carlsen, um jovem professor de prestÃ­gio. Por isso, Olive fica chocada quando o tirano dos laboratÃ³rios concorda em levar adiante a farsa e fingir ser seu namorado. De repente, seu pequeno experimento parece perigosamente prÃ³ximo da combustÃ£o e aquela pequena possibilidade cientÃ­fica, que era apenas uma hipÃ³tese sobre o amor, transforma-se em algo totalmente inesperado.\r\n', 'Romance', 'images/AHiptesedoAmorjpg'),
(83, 'Eu E Esse Meu CoraÃ§Ã£o', ' C. C. Hunter', 1, 0, 'Leah MacKenzie, de 17 anos, nÃ£o tem coraÃ§Ã£o. O que a mantÃ©m viva Ã© um coraÃ§Ã£o artificial que ela carrega dentro de uma mochila. Com seu tipo sanguÃ­neo raro, um transplante Ã© como um sonho distante. \r\nDe repente, Leah recebe uma segunda chance. O problema Ã© quando ela descobre que o doador Ã© um garoto da sua escola â€“ e que supostamente se matou!\r\nMatt, o irmÃ£o gÃªmeo do doador, se recusa a acreditar que Eric se suicidou. Quando Leah o procura, eles descobrem que ambos tÃªm sonhos semelhantes que podem ter pistas do que realmente aconteceu a Eric. Enquanto tentam desvendar esse mistÃ©rio, Matt e Leah se apaixonam e nÃ£o querem correr o risco de perder um ao outro.\r\n', 'Romance', 'images/Eueessemeucoraopng'),
(69, 'O Jogo Do Amor â€œodioâ€', 'Sally Thorne', 1, 0, 'Lucy Hutton e Joshua Templeman se odeiam. NÃ£o Ã© desgostar. NÃ£o Ã© tolerar. E eles nÃ£o tÃªm nenhum problema em demonstrar esses sentimentos em uma sÃ©rie de manobras ritualÃ­sticas passivo-agressivas enquanto permanecem sentados um diante do outro, trabalhando como assistentes executivos de uma editora.\r\nLucy nÃ£o consegue entender a abordagem apÃ¡tica que Joshua adota ao realizar seu trabalho. Ele, por sua vez, vive desorientado com as roupas coloridas de Lucy e suas excentricidades\r\nDiante da possibilidade de uma promoÃ§Ã£o, os dois travam uma guerra de egos e Lucy nÃ£o recua quando o jogo final pode lhe custar o trabalho de seus sonhos. Enquanto isso, a tensÃ£o entre o casal segue fervendo, e agora a moÃ§a se dÃ¡ conta de que talvez nÃ£o sinta Ã³dio por Joshua. E talvez ele tambÃ©m nÃ£o sinta Ã³dio por Lucy.\r\n', 'Romance', 'images/OJogoDoAmorodiojpg'),
(70, 'Amor em Manhattan', 'Sarah Margaret Morgan', 1, 0, 'TrÃªs amigas decidem abraÃ§ar a vida â€“ e o amor â€“ em Nova York. Calma, competente e organizada, Paige Walker adora um desafio. Depois de passar a infÃ¢ncia em hospitais, ela quer mais do que tudo provar seu valor. Mas quando ela perde seu emprego dos sonhos, Paige vai descobrir que o maior desafio serÃ¡ ser sua prÃ³pria chefe! SÃ³ que abrir sua prÃ³pria empresa de organizaÃ§Ã£o de eventos e concierge nÃ£o Ã© nada comparado a esconder sua paixonite por Jake Romano, o melhor amigo do seu irmÃ£o e o solteiro mais cobiÃ§ado de Manhattan. Mas quando Jake faz uma excelente proposta para a empresa de Paige, a quÃ­mica entre eles acaba se tornando incontrolÃ¡vel. SerÃ¡ que Ã© possÃ­vel convencer o homem que nÃ£o confia em ninguÃ©m a apostar em um feliz para sempre?', 'Romance', 'images/AmoremManhattanjpg'),
(71, 'Teto para Dois', ' Beth Oâ€™Leary', 1, 0, ' Depois de trÃªs meses do fim do seu relacionamento, Tiffy finalmente sai do apartamento do ex-namorado. Agora ela precisa encontrar o quanto antes um lugar barato onde morar. \r\nEnrolado com questÃµes financeiras, Leon tem uma ideia pouco convencional para conseguir\r\ndinheiro rÃ¡pido: anunciar seu apartamento com uma cama sÃ³, onde fica apenas no\r\nperÃ­odo da manhÃ£, nos dias Ãºteis, jÃ¡ que passa os fins de semana com a namorada\r\ne trabalha como enfermeiro no turno da noite.\r\nSem nunca terem se encontrado pessoalmente, Leon e Tiffy fecham um contrato de seis\r\nmeses e passam a resolver as trivialidades do dia a dia por Post-its espalhados\r\npela casa. Mas serÃ¡ que essa soluÃ§Ã£o aparentemente perfeita pode resistir a um\r\nex-namorado obsessivo, uma namorada ciumenta, um irmÃ£o encrencado, dois\r\nempregos exigentes e alguns amigos superprotetores?\r\n', 'Romance', 'images/TetoparaDoisjpg'),
(75, 'O CemitÃ©rio', 'Stephen King ', 1, 1, 'Louis Creed, um jovem mÃ©dico de Chicago, acredita que encontrou seu lugar em uma pequena cidade do Maine. A boa casa, o trabalho na universidade e a felicidade da esposa e dos filhos lhe trazem a certeza de que fez a melhor escolha. Num dos primeiros passeios pela regiÃ£o, conhecem um cemitÃ©rio no bosque prÃ³ximo Ã  sua casa. Ali, geraÃ§Ãµes de crianÃ§as enterraram seus animais de estimaÃ§Ã£o. Mas, para alÃ©m dos pequenos tÃºmulos, hÃ¡ um outro cemitÃ©rio. Uma terra maligna que atrai pessoas com promessas sedutoras. Um universo dominado por forÃ§as estranhas capazes de tornar real o que sempre pareceu impossÃ­vel. A princÃ­pio, Louis Creed se diverte com as histÃ³rias fantasmagÃ³ricas do vizinho Crandall. No entanto, quando o gato de sua filha Eillen morre atropelado e, subitamente, retorna Ã  vida, ele percebe que hÃ¡ coisas que nem mesmo a sua ciÃªncia pode explicar. Que mistÃ©rios esconde o cemitÃ©rio dos bichos? TerÃ¡ o homem o direito de interferir no mundo dos mortos? Em busca das respostas, Louis Creed Ã© levado por uma trama sobrenatural em que o limite entre a vida e a morte Ã© inexistente. E, quando descobre a verdade, percebe que ela Ã© muito pior que seus mais terrÃ­veis pesadelos. \r\n', 'Terror/Horror', 'images/OCemitriojpg'),
(76, 'O Exorcista', 'William Peter Blatty', 1, 1, 'nspirado no caso real do exorcismo de um adolescente, o escritor William Peter Blatty publicou em 1971 a perturbadora histÃ³ria de Chris MacNeil, uma atriz que sofre com inesperadas mudanÃ§as no comportamento da filha de 11 anos, Regan. Quando todos os esforÃ§os da ciÃªncia para descobrir o que hÃ¡ de errado com a menina falham e uma personalidade demonÃ­aca parece vir Ã  tona, Chris busca a ajuda da Igreja para tentar livrar a filha do que parece ser um raro caso de possessÃ£o. Cabe a Damien Karras, um padre da universidade de Georgetown, salvar a alma de Regan e ao mesmo tempo tentar restabelecer a prÃ³pria fÃ©, abalada desde a morte da mÃ£e. A menina Regan Ã©, ao mesmo tempo, o mal e sua vÃ­tima. Mesmo quarenta anos depois, seu sofrimento e o abismo entre o que ela era e o que se torna continuam nos atormentando a cada pÃ¡gina, a cada cena. \r\n', 'Terror/Horror', 'images/OExorcistajpg'),
(77, 'DrÃ¡cula', 'Bram Stoker', 1, 0, 'O jovem advogado inglÃªs Jonathan Harker Ã© enviado por seu patrÃ£o Ã  TransilvÃ¢nia, no leste da Europa, para atender um misterioso cliente. Ao chegar, descobre que seu anfitriÃ£o Ã©, na realidade, um poderoso vampiro: o conde DrÃ¡cula. Consegue entÃ£o fugir para a Inglaterra. LÃ¡, ao lado de sua noiva, Mina, e do Professor Van Helsing, Jonathan travarÃ¡ uma batalha de vida e morte contra o poder maligno de DrÃ¡cula. ', 'Terror/Horror', 'images/Drculajpg'),
(78, 'O Vilarejo', 'Raphael Montes', 1, 1, 'O Vilarejo narra a histÃ³ria de um pequeno povoado abandonado e diariamente maltratado pela fome, frio e solidÃ£o. Dentro dessa pequena vila, os mais assustadores acontecimentos se desenrolam a partir das respostas que os moradores encontram para a sua condiÃ§Ã£o. E tais soluÃ§Ãµes envolvem assassinato, tortura, escravidÃ£o, abuso, entre outras atrocidades que revelam o lado mais desumano daquelas pessoas. Aparentemente, tudo que os residentes daquele lugar precisavam era de alguÃ©m para dar um empurrÃ£ozinho. Ou melhor, algo.\r\n', 'Terror/Horror', 'images/OVilarejojpg'),
(79, 'O Colecionador', 'John Fowles', 1, 1, 'Frederick Clegg, um homem solitÃ¡rio, de origem humilde, menosprezado por uma sociedade esnobe, que encontra o grande amor de sua vida. Tudo o que ele deseja Ã© passar um tempo a sÃ³s com ela, demonstrar seus nobres sentimentos e deixar claro que eles nasceram um para o outro. O Colecionador tambÃ©m Ã© a histÃ³ria de Miranda Gray, uma jovem estudante de artes sequestrada por um manÃ­aco que acha que pode obrigÃ¡-la a se apaixonar por ele. Tudo o que ela deseja Ã© escapar do cativeiro, e vai usar de toda sua inteligÃªncia para sobreviver ao inferno em que sua vida se transformou. O Colecionador Ã© um livro narrado por dois personagens antagÃ´nicos: o sequestrador e sua vÃ­tima. Ferdinand e Miranda. Todos temos um pouco dos dois dentro de nÃ³s, concluÃ­mos ao final de suas pÃ¡ginas â€” quem consegue se desgrudar delas? \r\n', 'Terror/Horror', 'images/OColecionadorjpg'),
(80, 'O Homem De Giz', 'C.J. Tudor', 1, 1, 'Em 1986, Eddie e os amigos passam a maior parte dos dias andando de bicicleta pela pacata vizinhanÃ§a em busca de aventuras. Os desenhos a giz sÃ£o seu cÃ³digo secreto: homenzinhos rabiscados no asfalto; mensagens que sÃ³ eles entendem. Mas um desenho misterioso leva o grupo de crianÃ§as atÃ© um corpo desmembrado e espalhado em um bosque. Depois disso, nada mais Ã© como antes.\r\n\r\nEm 2016, Eddie se esforÃ§a para superar o passado, atÃ© que um dia ele e os amigos de infÃ¢ncia recebem um mesmo aviso: o desenho de um homem de giz enforcado. Quando um dos amigos aparece morto, Eddie tem certeza de que precisa descobrir o que de fato aconteceu trinta anos atrÃ¡s.\r\n', 'Terror/Horror', 'images/OHomemDeGizjpg'),
(81, 'Frankenstein', 'Mary Shelley', 1, 0, 'Victor Frankenstein Ã© um cientista que decide ultrapassar os limites entre vida e morte e resolve criar seu prÃ³prio ser vivo. Para isso, ele tenta reanimar tecidos mortos, para criar uma vida artificial. Com um resultado de sucesso, ele cria um ser, que o prÃ³prio cientista considera uma aberraÃ§Ã£o, pois ele tem desejos e sentimentos, assim como um humano. Ao perceber que sÃ£o opostos, hÃ¡ um confronto entre eles.\r\n', 'Terror/Horror', 'images/Frankensteinjpg'),
(82, 'O Orfanato da Srta. Peregrine Para CrianÃ§as Peculiares', 'Ransom Riggs', 1, 1, 'A histÃ³ria comeÃ§a com uma tragÃ©dia familiar que lanÃ§a Jacob, um rapaz de 16 anos, em uma jornada atÃ© uma ilha remota na costa do PaÃ­s de Gales, onde descobre as ruÃ­nas do Orfanato da Srta. Peregrine para CrianÃ§as Peculiares. Enquanto Jacob explora os quartos e corredores abandonados, fica claro que as crianÃ§as do orfanato sÃ£o muito mais do que simplesmente peculiares. Elas podem ter sido perigosas e confinadas na ilha deserta por um bom motivo. E, de algum modo - por mais impossÃ­vel que possa parecer - ainda podem estar vivas\r\n', 'Terror/Horror', 'images/OOrfanatodaSrtaPeregrineParaCrianasPeculiaresjpg'),
(84, 'Uma Dobra No Tempo', 'Madeleine Lâ€™Engle', 1, 1, 'O pai de Murry e Charles Wallace, um exÃ­mio fÃ­sico, estÃ¡ desaparecido hÃ¡ dois anos. A aventura comeÃ§a quando, em uma noite de tempestade, eles recebem a visita de uma senhora peculiar, a sra. Queque Ã©, que foi tirada de sua rota pelo vento enquanto viajava pelo tempo e espaÃ§o utilizando o tesserato. Na companhia de mais duas criaturas sobrenaturais, a sra. Quem e a sra. Qual, e de um garoto chamado Calvin Oâ€™Keefe, eles partem pelo universo em busca de qualquer indÃ­cio do paradeiro do dr. Murry. Mas o que eles descobrem vai muito alÃ©m disso: todo o universo estÃ¡ sendo atacado pela EscuridÃ£o, uma forÃ§a perigosa que traga a luz das estrelas e dos planetas, em uma luta contra o mal que parece nunca acabar.\r\n', 'Aventura', 'images/UmaDobranoTempojpg'),
(85, 'O Senhor Dos AnÃ©is', 'J. R. R. Tolkien', 1, 1, 'Frodo Bolseiro Ã© um hobbit assim como os outros â€“ um homenzinho pequeno de pÃ©s grandes â€“ que vive na sua vila. Tem uma vida caseira e sob os cuidados de seu tio, Bilbo, um hobbit que passou por diversas aventuras. Em um dia, o mago Gandalf, O Cinzento, anuncia que hÃ¡ uma grande missÃ£o: deve destruir um anel que retÃªm um poder muito grande que, nas mÃ£os erradas, pode causar o caos na Terra MÃ©dia.\r\n\r\nE quem tem esse anel? Bilbo que o conseguiu em suas aventuras anteriores. Mas a jornada para destruÃ­-lo nÃ£o Ã© pequeno. HaverÃ¡ uma sÃ©rie de obstÃ¡culos pela frente desde a necessidade de enfrentar diversos monstros fantÃ¡sticos atÃ© a perseguiÃ§Ã£o daqueles que querem tomar o anel.\r\n', 'Aventura', 'images/OSenhorDosAnisjpg'),
(86, 'A BÃºssola de Ouro', ' Philip Pullman', 1, 1, 'Lyra Belacqua e seu daemon, Pantalaimon, vivem felizes e soltos entre os catedrÃ¡ticos da Faculdade Jordan, em Oxford. AtÃ© que rumores invadem a cidade â€“ sÃ£o boatos sobre os PapÃµes, sequestradores de crianÃ§as que estÃ£o espalhando o medo pelo paÃ­s.\r\nQuando seu melhor amigo, Roger, desaparece, Lyra entra em uma perigosa jornada para reencontrÃ¡-lo. O que ela nÃ£o desconfia Ã© que muitas outras forÃ§as influenciam seu destino e que sua aventura a levarÃ¡ Ã s terras congeladas do Norte, onde feiticeiras e ursos de armadura se preparam para uma guerra.\r\n', 'Aventura', 'images/ABssoladeOurojpg'),
(87, 'As CrÃ´nicas de NÃ¡rnia ', 'C. S. Lewis', 1, 1, 'LÃºcia, Susana, Edmundo e Pedro sÃ£o irmÃ£os que, por causa da Segunda Guerra Mundial, sÃ£o obrigados a deixar Londres para morar no interior com um professor, amigo de seus pais. Para fugir dos bombardeios dos constantes combates, o quarteto embarca num trem sem imaginar os grandes desafios que teriam pela frente. Tudo comeÃ§a em uma brincadeira de esconde-esconde, quando LÃºcia, a mais nova, descobre um guarda-roupa que reserva uma passagem secreta para um paÃ­s mÃ¡gico chamado NÃ¡rnia.\r\n\r\nNo novo mundo, seres fantÃ¡sticos vivem sob o domÃ­nio da Feiticeira Branca, Jadis. Em NÃ¡rnia, o inverno Ã© eterno nunca hÃ¡ Natal. Centauros, faunos, gigantes e outros animais falantes vivem infelizes com a maldiÃ§Ã£o, declarada na ausÃªncia do LeÃ£o Aslam, que agora retorna ao reino ao lado das crianÃ§as. Juntos, todos irÃ£o lutar para acabar com a profecia de Jadis e liberar o local do domÃ­nio do mal.\r\n', 'Aventura', 'images/AsCrnicasdeNrniajpg'),
(88, 'A Volta Ao Mundo Em 80 Dias', ' Jules Verne ', 2, 1, ' Londres, 1872. Ao sentir-se desafiado por seus companheiros de clube, o gentleman inglÃªs Phileas Fogg aposta que Ã© capaz de dar a volta ao mundo em apenas 80 dias, arriscando todo o seu dinheiro. Homem misterioso, de poucas palavras e rotina inabalÃ¡vel, Fogg inicia a viagem no mesmo dia, levando consigo apenas seu empregado recÃ©m-contratado, o francÃªs Jean Passepartout, e uma bolsa.\r\n', 'Aventura', 'images/AVoltaaomundoem80diasjpg'),
(89, 'A InvenÃ§Ã£o de Hugo Cabret', 'Brian Selznick ', 1, 1, 'Em 1931, o menino Ã³rfÃ£o Hugo Cabret vive escondido em uma estaÃ§Ã£o de trem de Paris. Ali, cuida do funcionamento de gigantescos relÃ³gios no lugar do tio que desapareceu. Ã€ noite, tenta consertar uma mÃ¡quina de aparÃªncia humana para desvendar uma mensagem oculta, usando peÃ§as de brinquedos que ele furta. Seus planos, porÃ©m, correm risco. Ele Ã© descoberto pelo dono da loja de brinquedos da estaÃ§Ã£o e pela curiosa Isabelle. \r\n', 'Aventura', 'images/AInvenodeHugoCabretjpg'),
(90, ' Alice no PaÃ­s das Maravilhas', 'Lewis Carroll', 1, 1, 'O livro conta a histÃ³ria de Alice, uma menina curiosa que segue um Coelho Branco de colete e relÃ³gio, mergulhando sem pensar na sua toca. A protagonista Ã© projetada para um novo mundo, repleto de animais e objetos antropomÃ³rficos, que falam e se comportam como seres humanos.\r\n', 'Aventura', 'images/AliceNoPasDasMaravilhaspng'),
(91, 'O Homem InvisÃ­vel ', 'H. G. Wells', 1, 1, 'A histÃ³ria se passa na Inglaterra. O ambicioso cientista Griffin, apÃ³s desenvolver uma fÃ³rmula que o torna invisÃ­vel, perambula com o rosto coberto por bandagens, intrigando os habitantes de um vilarejo.\r\n\r\nAs pequenas confusÃµes e os acidentes cÃ´micos causados por sua peculiar condiÃ§Ã£o logo revelariam o terror de um homem que perde a prÃ³pria imagem.\r\n', 'Aventura', 'images/OHomemInvisiveljpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livros_reservados`
--

CREATE TABLE IF NOT EXISTS `livros_reservados` (
`id` int(11) NOT NULL,
  `livro_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `data_reserva` date DEFAULT NULL,
  `data_devolucao` date NOT NULL,
  `multa` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Extraindo dados da tabela `livros_reservados`
--

INSERT INTO `livros_reservados` (`id`, `livro_id`, `user_id`, `data_reserva`, `data_devolucao`, `multa`) VALUES
(16, 67, 11, '2023-06-28', '2023-07-13', 0),
(18, 83, 38, '2023-06-28', '2023-07-13', 0),
(19, 77, 44, '2023-07-05', '2023-07-20', 0),
(20, 74, 44, '2023-07-05', '2023-07-20', 0),
(21, 70, 44, '2023-07-05', '2023-07-20', 0),
(22, 73, 44, '2023-07-05', '2023-07-20', 0),
(23, 71, 44, '2023-07-05', '2023-07-20', 0),
(24, 69, 44, '2023-07-05', '2023-07-20', 0),
(25, 81, 47, '2023-07-12', '2023-07-27', 0),
(15, 81, 11, '2023-06-21', '2023-07-06', 0),
(17, 72, 38, '2023-06-28', '2023-07-13', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `media_avaliacoes`
--

CREATE TABLE IF NOT EXISTS `media_avaliacoes` (
  `livro_id` int(11) NOT NULL,
  `media` decimal(3,1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `media_avaliacoes`
--

INSERT INTO `media_avaliacoes` (`livro_id`, `media`) VALUES
(31, '1.0'),
(29, '5.0'),
(27, '2.5'),
(44, '3.0'),
(42, '3.0'),
(43, '4.0'),
(67, '2.5'),
(83, '2.0'),
(77, '1.0'),
(74, '2.0');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoas`
--

CREATE TABLE IF NOT EXISTS `pessoas` (
`id` int(11) unsigned NOT NULL,
  `nome` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=48 ;

--
-- Extraindo dados da tabela `pessoas`
--

INSERT INTO `pessoas` (`id`, `nome`, `user`, `email`, `senha`) VALUES
(47, 'mateus', 'mateuss002', 'mateus@gmail.com', '123456'),
(44, 'asdasd', 'asdsadasd', 'gabrielziliotto515@gmail.com', '123123'),
(45, 'Leticia', 'le', 'letwessler@gmail.com', '12341234'),
(46, 'gabriel', 'gziliotto', 'gabriel_ziliotto@estudante.sesisenai.org.br', '123123');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE IF NOT EXISTS `turmas` (
`id` int(11) NOT NULL,
  `turma` varchar(255) NOT NULL
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `turmas`
--

INSERT INTO `turmas` (`id`, `turma`) VALUES
(1, 'turma 1'),
(2, 'turma 2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adm`
--
ALTER TABLE `adm`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
 ADD PRIMARY KEY (`id`), ADD KEY `livro_id` (`livro_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carrinho`
--
ALTER TABLE `carrinho`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clublivro`
--
ALTER TABLE `clublivro`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livros`
--
ALTER TABLE `livros`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `livros_reservados`
--
ALTER TABLE `livros_reservados`
 ADD PRIMARY KEY (`id`), ADD KEY `livro_id` (`livro_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `media_avaliacoes`
--
ALTER TABLE `media_avaliacoes`
 ADD PRIMARY KEY (`livro_id`);

--
-- Indexes for table `pessoas`
--
ALTER TABLE `pessoas`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `turmas`
--
ALTER TABLE `turmas`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adm`
--
ALTER TABLE `adm`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `avaliacoes`
--
ALTER TABLE `avaliacoes`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `carrinho`
--
ALTER TABLE `carrinho`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `clublivro`
--
ALTER TABLE `clublivro`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `livros`
--
ALTER TABLE `livros`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `livros_reservados`
--
ALTER TABLE `livros_reservados`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `pessoas`
--
ALTER TABLE `pessoas`
MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=48;
--
-- AUTO_INCREMENT for table `turmas`
--
ALTER TABLE `turmas`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
