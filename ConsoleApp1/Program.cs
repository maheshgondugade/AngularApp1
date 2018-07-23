using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApplication1.Models;
using ClosedXML.Excel;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            GetClaim();
        }


        public static IEnumerable<ClaimModel> GetClaim()
        {
            List<ClaimModel> claims = new List<ClaimModel>();

            //var datatable = new DataTable();
            var workbook = new XLWorkbook(@"C:\Demo Project\Copy of HealthCare Test Data set risk stratification.xlsx");
            var xlWorksheet = workbook.Worksheet(1);
            var range = xlWorksheet.Range(xlWorksheet.FirstCellUsed(), xlWorksheet.LastCellUsed());

            var col = range.ColumnCount();
            var row = range.RowCount();


            ////if a datatable already exists, clear the existing table 
            ////datatable.Clear();
            //for (var i = 2; i <= col-3; i++)
            //{
            //    var column = xlWorksheet.Cell(1, i);
            //    //claims.Add()
            //    //.Columns.Add(column.Value.ToString());
            //}

            var firstHeadRow = 0;
            foreach (var item in range.Rows())
            {
                if (firstHeadRow != 0)
                {
                    var arr = new object[col];
                    for (var y = 1; y <= col-3; y++)
                    {
                        arr[y - 1] = item.Cell(y).Value;
                    }

                    claims.Add(new ClaimModel()
                    {
                        Age = Convert.ToInt32(arr[1]),
                        //Gender = arr[2].ToString() == "M" ? WebApplication1.Enums.Gender.M : WebApplication1.Enums.Gender.F,
                        DiagosisCode = arr[7].ToString()
                        });
                    }
                firstHeadRow++;
            }

            return claims;
        }
    }
}
