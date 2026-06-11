<%@page language="java" import="java.sql.*" %>

<%
    // 1. Get information entered by the user
    String vnome     = request.getParameter("txtnome");
    String vsenha    = request.getParameter("txtsenha");
    String vemail    = request.getParameter("txtemail");
    String vtelefone = request.getParameter("txttelefone");

    // 2. Database connection variables
    String database  = "exemplos";
    String endereco  = "jdbc:mysql://localhost:3306/" + database;
    String usuario   = "root";
    String senha     = "";

    // 3. FIXED DRIVER NAME (Removed the trailing dot)
    String driver = "com.mysql.cj.jdbc.Driver";

    // Load Driver into memory
    Class.forName(driver);

    // Open connection
    Connection conexao;
    conexao = DriverManager.getConnection(endereco, usuario, senha);

    // 4. Prepare SQL Statement
    String sql = "INSERT INTO cadastro (nome, senha, email, telefone) VALUES (?, ?, ?, ?)";
    PreparedStatement stm = conexao.prepareStatement(sql);
    
    stm.setString(1, vnome);
    stm.setString(2, vsenha);
    stm.setString(3, vemail);
    stm.setString(4, vtelefone);

    // 5. Execute the update (Insert)
    stm.executeUpdate(); 
    stm.close();
    conexao.close(); // Good practice to close the connection too!

    // 6. Success Message
    out.print("<h3>Dados gravados com sucesso!</h3>");
    out.print("<br><br>");
    out.print("<a href='cadastro.html'>Voltar para o Formulário</a> | ");
    out.print("<a href='consulta.jsp'>Ver Cadastros</a>");
%>
