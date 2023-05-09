/*$(document).ready(function () {
     $("#btnEnviar").click(function () {
          var persona  = $("#txtDestino").val()
          var texto  = $("#txtTexto").val()
         $.ajax({
             url: "http://localhost/services/ExamenServise.asmx/Cifrar?Texto="+texto+"&numero="+persona,
             type: "GET",
             dataType:"JSON",
             success: function (a) {
               alert("perro")   
               if(a > 0){
                       alert("perro")
                  }
             }
         });
     });
 });*/

$(document).ready(function () {
     var listaMensaje = [];
     var listaNumero = []
     var myArray = new Array();
     $("#btnEnviar").click(function () {
          var persona = $("#txtDestino").val()
          var texto = $("#txtTexto").val()
          $.ajax({
               url: "http://localhost/services/ExamenServise.asmx/Cifrar",
               type: "POST",
               data: { Texto: texto, numero: persona },
               success: function (a) {
                    var jsonText = JSON.stringify(xmlToJson(a));
                    var response = JSON.parse(jsonText)
                    var mensajEncriptado = response.string["#text"]
                    listaMensaje.push(response.string["#text"])
                    listaNumero.push(persona)
                    $("#txtresponse").val(mensajEncriptado)
               
               },
               error: function (a) {
                    alert("error")

               }
          });
     });

     function xmlToJson(xml) {
          // Create the return object
          var obj = {};
          if (xml.nodeType == 1) { // element
               // do attributes
               if (xml.attributes.length > 0) {
                    obj["@attributes"] = {};
                    for (var j = 0; j < xml.attributes.length; j++) {
                         var attribute = xml.attributes.item(j);
                         obj["@attributes"][attribute.nodeName] = attribute.nodeValue;
                    }
               }
          } else if (xml.nodeType == 3) { // text
               obj = xml.nodeValue;
          }

          // do children
          if (xml.hasChildNodes()) {
               for (var i = 0; i < xml.childNodes.length; i++) {
                    var item = xml.childNodes.item(i);
                    var nodeName = item.nodeName;
                    if (typeof (obj[nodeName]) == "undefined") {
                         obj[nodeName] = xmlToJson(item);
                    } else {
                         if (typeof (obj[nodeName].push) == "undefined") {
                              var old = obj[nodeName];
                              obj[nodeName] = [];
                              obj[nodeName].push(old);
                         }
                         obj[nodeName].push(xmlToJson(item));
                    }
               }
          }
          return obj;
     };

     $("#btnEnviados").click(function () {
          var persona = $("#txtrecibido").val()
          var texto = $("#txtresponse").val()
          var numero = $("#txtMes").val()
          if (persona == numero) {              
               $.ajax({
                    url: "http://localhost/services/ExamenServise.asmx/Descifrar",
                    type: "POST",
                    data: { Texto: texto, numero: persona },
                    success: function (a) {
                         var jsonText = JSON.stringify(xmlToJson(a));
                         var response = JSON.parse(jsonText)
                         var mensajEncriptado = response.string["#text"]
                         $("#dvResults").val(mensajEncriptado)
                    },
                    error: function (a) {
                         alert("error")

                    }
               });

          }{
               $("#dvResults").val("No hay coincidencias para este usuario")
          }

     });





});