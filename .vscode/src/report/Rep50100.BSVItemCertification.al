namespace ALProject.ALProject;
using Microsoft.Inventory.Item;

report 50100 "BSV Item Certification"
{
    ApplicationArea = All;
    Caption = 'BSV Item Certification';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = './src/BSV Item Certification.rdl';
    dataset
    {
        dataitem(BSVItemCertification; "BSV Item Certification")
        {
            column(Code; "Code")
            {
            }
            column(Description; Description)
            {
            }
            column(StartDate; "Start Date")
            {
            }
            column(EndDate; "End Date")
            {
            }
            column(Active; Active)
            {
            }
            column(Item_Code; "Item code") { }
            column(DescriptionItem; DescriptionItem) { }
            column(Today; Today) { }
            column(TotalCertifications; "TotalCertifications") { }
            column(TotalExpired; "TotalExpired") { }
            column(TotalActive; "TotalActive") { }

            trigger OnAfterGetRecord()
            var
                TodayDate: Date;
                ItemRec: Record Item;
            begin
                Clear(TotalCertifications);
                Clear(TotalActive);
                Clear(TotalExpired);
                TodayDate := Today;

                TotalCertifications := 1;

                if "End Date" < TodayDate then
                    TotalExpired := 1;

                if Active then
                    TotalActive := 1;

                Clear(DescriptionItem);
                if ItemRec.Get("Item Code") then
                    DescriptionItem := ItemRec.Description;

            end;

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(ItemGroup)
                {

                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        TotalCertifications: Integer;
        TotalExpired: Integer;
        TotalActive: Integer;

        DescriptionItem: Text[100];
}