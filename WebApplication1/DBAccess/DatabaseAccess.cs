using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;
using ClosedXML.Excel;
using System.IO;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

namespace WebApplication1.DBAccess
{
    public class DatabaseAccess
    {
        string consString = string.Empty;
        public DatabaseAccess()
        {
            consString = ConfigurationManager.AppSettings["constr"].ToString();
        }

        internal void InsertData()
        {
            if (File.Exists(@"C:\Demo Project\Copy of HealthCare Test Data set risk stratification.xlsx"))
            {
                DataTable dt = new DataTable();

                dt.Columns.Add(new DataColumn("ClaimID", typeof(int)));
                dt.Columns.Add(new DataColumn("PatientID", typeof(int)));
                dt.Columns.Add(new DataColumn("Age", typeof(int)));
                dt.Columns.Add(new DataColumn("Gender", typeof(string)));
                dt.Columns.Add(new DataColumn("ServiceCode", typeof(string)));
                dt.Columns.Add(new DataColumn("Description", typeof(string)));
                dt.Columns.Add(new DataColumn("RevenueCode", typeof(string)));
                dt.Columns.Add(new DataColumn("RevenueDescription", typeof(string)));
                dt.Columns.Add(new DataColumn("DiagosisCode", typeof(string)));
                dt.Columns.Add(new DataColumn("MaritalStatus", typeof(string)));
                dt.Columns.Add(new DataColumn("Smoking", typeof(string)));
                dt.Columns.Add(new DataColumn("Alcohol", typeof(string)));
                dt.Columns.Add(new DataColumn("PrescribedDrugs", typeof(string)));
                dt.Columns.Add(new DataColumn("Geography", typeof(string)));
                dt.Columns.Add(new DataColumn("HCCCode", typeof(int)));


                List<PatientModel> patientData = new List<PatientModel>();
                try
                {
                    var workbook = new XLWorkbook(@"C:\Demo Project\Copy of HealthCare Test Data set risk stratification.xlsx");
                    var xlWorksheet = workbook.Worksheet(1);
                    var range = xlWorksheet.Range(xlWorksheet.FirstCellUsed(), xlWorksheet.LastCellUsed());

                    var col = range.ColumnCount();
                    var row = range.RowCount();

                    var firstHeadRow = 0;
                    foreach (var item in range.Rows())
                    {
                        Random r = new Random();
                        int rInt = r.Next(1, 5);

                        if (firstHeadRow != 0)
                        {
                            var arr = new object[col];
                            for (var y = 1; y <= 13; y++)
                            {
                                arr[y - 1] = item.Cell(y).Value;
                            }

                            DataRow dr = null;
                            dr = dt.NewRow();

                            dr["ClaimID"] = Convert.ToInt32(arr[0]);
                            dr["PatientID"] = Convert.ToInt32(arr[0]);
                            dr["Age"] = Convert.ToInt32(arr[1]);
                            dr["Gender"] = Convert.ToString(arr[2]) == "M" ? "Male" : "Female";
                            dr["ServiceCode"] = Convert.ToString(arr[3]);
                            dr["Description"] = Convert.ToString(arr[4]);
                            dr["RevenueCode"] = Convert.ToString(arr[5]);
                            dr["RevenueDescription"] = Convert.ToString(arr[6]);
                            dr["DiagosisCode"] = Convert.ToString(arr[7]);
                            dr["MaritalStatus"] = Convert.ToString(arr[8]);
                            dr["Smoking"] = Convert.ToString(arr[9]);
                            dr["Alcohol"] = Convert.ToString(arr[10]);
                            dr["PrescribedDrugs"] = Convert.ToString(arr[11]);
                            dr["Geography"] = Convert.ToString(arr[12]);
                            dr["HCCCode"] = rInt;

                            dt.Rows.Add(dr);
                        }
                        firstHeadRow++;
                    }


                    using (SqlConnection con = new SqlConnection(consString))
                    {
                        using (SqlCommand cmd = new SqlCommand("Insert_Patients"))
                        {
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@tblPatient", dt);
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                        }
                    }
                }
                catch (Exception e)
                {
                    throw;
                }
            }

        }

        internal IEnumerable<PatientModel> GetPatientData()
        {
            List<PatientModel> patientData = new List<PatientModel>();
            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(consString))
                {
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter("GetPatientData", con))
                    {
                        da.Fill(dt);
                        con.Close();
                    }
                }
                patientData = (from DataRow dr in dt.Rows
                               select new PatientModel()
                               {
                                   ClaimID = Convert.ToInt32(dr["ClaimID"]),
                                   PatientID = Convert.ToInt32(dr["PatientID"]),
                                   Age = Convert.ToInt32(dr["Age"]),
                                   Gender = Convert.ToString(dr["Gender"]),
                                   ServiceCode = Convert.ToString(dr["ServiceCode"]),
                                   Description = Convert.ToString(dr["Description"]),
                                   RevenueCode = Convert.ToString(dr["RevenueCode"]),
                                   RevenueDescription = Convert.ToString(dr["RevenueDescription"]),
                                   DiagosisCode = Convert.ToString(dr["DiagosisCode"]),
                                   MaritalStatus = Convert.ToString(dr["MaritalStatus"]),
                                   Smoking = Convert.ToString(dr["Smoking"]),
                                   Alcohol = Convert.ToString(dr["Alcohol"]),
                                   PrescribedDrugs = Convert.ToString(dr["PrescribedDrugs"]),
                                   Geography = Convert.ToString(dr["Geography"]),
                                   HCCCode = Convert.ToInt32(dr["HCCCode"])
                               }).ToList();

                return patientData;
            }
            catch (Exception e)
            {
                throw;
            }
        }


        internal IEnumerable<ClinicModel> GetClinicData()
        {
            List<ClinicModel> clinic = new List<ClinicModel>();

            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(consString))
                {
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter("GetClinicData", con))
                    {
                        da.Fill(dt);
                        con.Close();
                    }
                }
                clinic = (from DataRow dr in dt.Rows
                          select new ClinicModel()
                          {
                              ClinicID = Convert.ToInt32(dr["PatientID"]),
                              PatientID = Convert.ToInt32(dr["PatientID"]),
                              MaritalStatus = Convert.ToString(dr["MaritalStatus"]),
                              Smoking = Convert.ToString(dr["Smoking"]),
                              Alcohol = Convert.ToString(dr["Alcohol"]),
                              PrescribedDrugs = Convert.ToString(dr["PrescribedDrugs"]),
                              Geography = Convert.ToString(dr["Geography"]),
                          }).ToList();

            }
            catch (Exception e)
            {
                throw;
            }
            return clinic;
        }
        internal IEnumerable<ClaimModel> GetClaimData()
        {
            List<ClaimModel> clinic = new List<ClaimModel>();

            try
            {
                DataTable dt = new DataTable();
                using (SqlConnection con = new SqlConnection(consString))
                {
                    con.Open();

                    using (SqlDataAdapter da = new SqlDataAdapter("GetClaimData", con))
                    {
                        da.Fill(dt);
                        con.Close();
                    }
                }
                clinic = (from DataRow dr in dt.Rows
                          select new ClaimModel()
                          {
                              ClaimID = Convert.ToInt32(dr["ClaimID"]),
                              PatientID = Convert.ToInt32(dr["PatientID"]),
                              Age = Convert.ToInt32(dr["Age"]),
                              Gender = Convert.ToString(dr["Gender"]),
                              ServiceCode = Convert.ToString(dr["ServiceCode"]),
                              Description = Convert.ToString(dr["Description"]),
                              RevenueCode = Convert.ToString(dr["RevenueCode"]),
                              RevenueDescription = Convert.ToString(dr["RevenueDescription"]),
                              DiagosisCode = Convert.ToString(dr["DiagosisCode"]),
                          }).ToList();

            }
            catch (Exception e)
            {
                throw;
            }
            return clinic;

        }

    }
}