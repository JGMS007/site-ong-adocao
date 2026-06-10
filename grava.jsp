<%@page language="java" import="java.sql.*" %>

<%

    //Criar as variaveis e armazenar as informações digitadas pelo usuário
    String vnome  = request.getParameter("txtnome") ;
    String vsenha  = request.getParameter("txtsenha") ;
    String vemail = request.getParameter("txtemail") ;
    String vtelefone = request.getParameter("txttelefone") ;

    //Variaveis para acessar o banco de dados
    String database  = "exemplos" ;
    String endereco  = "jdbc:mysql://localhost:3306/" + database ;
    String usuario   = "root" ;
    String senha     = "" ;

    //DRIVER
    String driver = "com.mysql.jdbc.Driver" ;

    //Carregar o Driver na memoria
    Class.forName( driver ) ;

    //Cria a variavel para conectar com o banco
    Connection conexao ;

    //Abrir a conexao com o banco
    conexao = DriverManager.getConnection( endereco , usuario , senha ) ;

    String sql = "INSERT INTO cadastro (nome,senha,email,telefone) VALUES (?, ?, ?, ?)" ;

    //Preparar o comando para inserir
    PreparedStatement stm = conexao.prepareStatement( sql ) ;
    stm.setString( 1 , vnome )  ;
    stm.setString( 2 , vsenha )  ;
    stm.setString( 3 , vemail )  ;
    stm.setString( 4 , vtelefone )  ;

    stm.execute() ;
    stm.close() ;

    out.print("<h3>Dados gravados com sucesso!</h3>") ;
    out.print("<br><br>") ;
    out.print("<a href='home.html'>Voltar</a>") ;

	%>
