<!doctype html>

  <!--[if lt IE 7]><html lang="en-US" xmlns:fb="http://ogp.me/ns/fb#" xmlns:addthis="http://www.addthis.com/help/api-spec"  prefix="og: http://ogp.me/ns#" class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
  <!--[if (IE 7)&!(IEMobile)]><html lang="en-US" xmlns:fb="http://ogp.me/ns/fb#" xmlns:addthis="http://www.addthis.com/help/api-spec"  prefix="og: http://ogp.me/ns#" class="no-js lt-ie9 lt-ie8"><![endif]-->
  <!--[if (IE 8)&!(IEMobile)]><html lang="en-US" xmlns:fb="http://ogp.me/ns/fb#" xmlns:addthis="http://www.addthis.com/help/api-spec"  prefix="og: http://ogp.me/ns#" class="no-js lt-ie9"><![endif]-->
  <!--[if gt IE 8]><!--> <html lang="en-US" xmlns:fb="http://ogp.me/ns/fb#" xmlns:addthis="http://www.addthis.com/help/api-spec"  prefix="og: http://ogp.me/ns#" class="no-js"><!--<![endif]-->

  <head>
    <%= erb :head %>

    <title>Specialty Sandwiches - Backcountry Delicatessen</title>

  </head>
  <body class="page page-id-9 page-parent page-template-default">

    <div id="container">

      <%= erb :header %>

      <div id="content">
        <div id="foodmenu_wrapper">
          <div class="foodmenu-left">
          <h1>Specialty Sandwiches</h1>
            <div class="foodcol-1">
              <%menu.type.each do |type|%>
                <form action='/admin_menu/<%= menu.type%>' method='POST'>
                  <input type='text' name= 'menu[type]' value="<%= menu.type%>"/><br/>
                </form>
                <input type= 'submit' value='Update'/>
                <% type.items.each do |item| %>
                  <div class="food-title-area">
                    <form action='/admin_menu/<%= item.id %>' method='POST'>
                      <input type='text' name="item[title]" value="<%= item.title %>"/><br/>
                      <input type="text" class="food-price"><%=item.price%>/><br/>
                      <textarea name='item[description]' cols='40' rows='2'><%=item.description%><textarea/>
                      <input type='submit' value='Update'/>
                    </form>
                  </div>
                <% end %>
              <%end%>
            </div> <!--food-col-1-->
            <div class="clearfix"></div>
          </div> <!-- foodmenu_left -->

          <%= erb :menu_right %>

          <div class="clearfix"></div>

        </div> <!-- foodmenu-wrapper -->
      </div> <!-- end #content -->

      <%= erb :footer %>

    </div> <!-- end #container -->

    <!-- all js scripts are loaded in library/bones.php -->
    <%= erb :script %>
<!--wp_footer-->
  </body>

</html> <!-- end page. what a ride! -->
