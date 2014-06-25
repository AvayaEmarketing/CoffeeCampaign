using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.Services;
using System.Web.Script.Serialization;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Net.Mime;
using System.Text;


    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod(EnableSession = true)]
        public static string codeValidation(string code)
        {
            string datos = "";
            string result = "";
            string codigo = "";
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["calawebConnectionString"].ToString();
            string stmt = "select (code + ',' + usuario  +',' + empresa + ',' + telefono + ',' + cargo) as data from coffeecampaign2014 where code = @code";
            SqlCommand cmd2 = new SqlCommand(stmt, con);
            cmd2.Parameters.AddWithValue("@code", code);
            try
            {
                con.Open();
                datos = (String)cmd2.ExecuteScalar();
                var test = datos.Split(',');
                codigo = test[0];
                string usuario = test[1];
                string empresa = test[2];
                string telefono = test[3];
                string cargo = test[4];

                if (code == codigo)
                {
                    result = sendMails(usuario,empresa,telefono,cargo);

                }
                
                con.Close();
            }
            catch (Exception ex)
            {
                result = "Error";
            }
            finally
            {
                con.Close();
            }

            return result;

        }

        public static string sendMails(string usuario,string empresa,string telefono,string cargo)
        {
            string result = "";
            string title = "Titulo";
            string correos = getCorreos();
            string rta_mail = "";
            
            try
            {
                string data = "<table width=\"500\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"left\" style=\"font-family: Arial, Helvetica, sans-serif; font-size: 12px;margin-top:14pt;margin-bottom:14pt;\"><tr><td style=\"color:#cc0000;\">Nombre:</td><td>" + usuario + "</td></tr><tr><td style=\"color:#cc0000;\">Empresa: </td><td>" + empresa + "</td></tr><tr><td style=\"color:#cc0000;\">Telefono:</td><td>" + telefono + "</td></tr><tr><td style=\"color:#cc0000;\">Cargo:</td><td>" + cargo + "</td></tr></table>"; 
                string plantilla = getContenidoMail(data);
                string[] destinatarios = correos.Split(',');
                foreach (string mail in destinatarios)
                {
                    rta_mail = SendMail(mail, "e-marketing@avaya.com", title, plantilla);
                }
                
                result = rta_mail;
            }
            catch (Exception ex)
            {
                result = "false" + ex.Message;
            }
            return result;

        }

        public static string SendMail(string to, string from, string subject, string contenido)
        {
            string respuesta = "";

            MailAddress sendfrom = new MailAddress(from, "Avaya Marketing Experience");
            MailAddress sendto = new MailAddress(to);
            MailMessage message = new MailMessage();

            ContentType mimeType = new System.Net.Mime.ContentType("text/html");
            string body = HttpUtility.HtmlDecode(contenido);
            AlternateView alternate = AlternateView.CreateAlternateViewFromString(body, mimeType);
            message.AlternateViews.Add(alternate);

            message.From = new MailAddress(from, "Avaya Marketing Experience");
            message.To.Add(to);
            message.Subject = subject;

            SmtpClient client = new SmtpClient("localhost");

            try
            {
                client.Send(message);
                respuesta = "ok";

            }
            catch (SmtpException e)
            {
                respuesta = "fail" + e.Message;
                throw new SmtpException(e.Message);
            }
            return respuesta;
        }

        public static string getContenidoMail(string data)
        {

            string plantilla = getPlantilla();


            Dictionary<string, string> dataIndex = new Dictionary<string, string>();
            dataIndex.Add("{data}", data);


            string buscar = "";
            string reemplazar = "";
            string index = "";
            //Recorrer la plantilla del index para reemplazar el contenido
            foreach (var datos in dataIndex)
            {
                buscar = datos.Key;
                reemplazar = datos.Value;
                index = plantilla.Replace(buscar, reemplazar);
                plantilla = index;
            }

            return plantilla;
        }

        public static string getPlantilla()
        {
            string fullPath = HttpContext.Current.Server.MapPath("~");
            string html = "";
            html = File.ReadAllText(fullPath + "template_mail.html");
            //html = File.ReadAllText(fullPath + "CoffeeCampaign\\template_mail.html");
            return html;
        }

        public static string getCorreos()
        {

            string correos;
            correos = "wballesteros@avaya.com";
            return correos;
        }



    }
