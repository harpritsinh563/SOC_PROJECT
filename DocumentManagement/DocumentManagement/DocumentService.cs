using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DocumentManagement.Models;

namespace DocumentManagement
{
    public class DocumentService : IDocumentService
    {
        SqlConnection conn;
        SqlCommand cmd;

        void initDb()
        {
            conn = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=SOC;Integrated Security=True");
            cmd = new SqlCommand();
            cmd.Connection = conn;
        }

        public int AddDocument(Document doc)
        {
            initDb();
            cmd.CommandText = "INSERT INTO [Document] VALUES (@UserId,@DocType,@DocPath)";
            cmd.Parameters.AddWithValue("@UserId", doc.UserId);
            cmd.Parameters.AddWithValue("@DocType", doc.DocumentType);
            cmd.Parameters.AddWithValue("@DocPath", doc.DocumentPath);
            conn.Open();
        
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (System.Data.SqlClient.SqlException e)
            {
                conn.Close();
                return 0;
            }
            conn.Close();
            return 1;
        }
        public int RemoveDocument(int docId)
        {
            initDb();
            cmd.CommandText = "DELETE FROM [Document] WHERE documentId=@DocId";
            cmd.Parameters.AddWithValue("@DocId", docId);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
            return 1;
        }

        public Document GetDocument(int docId)
        {
            Document doc = new Document();
            cmd.CommandText = "SELECT * FROM [Document] WHERE documentId=@DocId";
            cmd.Parameters.AddWithValue("@DocId", docId);
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                doc.DocumentId = dr.GetInt32(0);
                doc.UserId = dr.GetInt32(1);
                doc.DocumentType = dr.GetString(2);
                doc.DocumentPath = dr.GetString(3);
            }
            dr.Close();
            conn.Close();
            return doc;
        }

        public DataSet GetDocumentsOfUser(int userId)
        {
            initDb();
            conn.Open();
            cmd.CommandText = "SELECT * FROM [Document] WHERE userId=@UserId";
            cmd.Parameters.AddWithValue("@UserId", userId);
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds, "Documents");
            conn.Close();
            return ds;
        }

    }
}
