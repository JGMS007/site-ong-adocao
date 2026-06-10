<%@page language="java" import="java.sql.*" %>
<!Doctype html>
<html lang="pt-br">
   <head>
        <meta charset="utf-8">
        <title>Consulta Dados</title>
   </head>
   <body>
      <h1>Consulta Dados</h1>

      <%
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

            String sql = "SELECT * FROM cadastro ORDER BY nome" ;

            //Preparar o comando para inserir
            PreparedStatement stm = conexao.prepareStatement( sql ) ;

            ResultSet dados = stm.executeQuery();

            out.print("<table border=1>");
              out.print("<tr>");  
                out.print("<th>Codigo</th>");
                out.print("<th>Nome</th>");
                out.print("<th>Senha</th>");
                out.print("<th>Email</th>");
                out.print("<th>Telefone</th>");
              out.print("</tr>");  

              while ( dados.next()) {
                out.print("<tr>");
                  out.print("<td>");
                  out.print( dados.getString("codigo"))  ;
                  out.print("</td>");

                  out.print("<td>");
                  out.print( dados.getString("nome"))  ;
                  out.print("</td>");

                  out.print("<td>");
                  out.print( dados.getString("senha"))  ;
                  out.print("</td>");

                  out.print("<td>");
                  out.print( dados.getString("email"))  ;
                  out.print("</td>");

                  out.print("<td>");
                  out.print( dados.getString("telefone"))  ;
                  out.print("</td>");

                  out.print("</tr>");
              }
              out.print("</table>");
              stm.close() ;
      %>

   </body>
</html>
