namespace ALProject.ALProject;

page 50100 "BSV Item Certification Setup"
{
    ApplicationArea = All;
    Caption = 'BSV Item Certification Setup';
    PageType = List;
    SourceTable = "BSV Item Certification";
    UsageCategory = Lists;
    layout

    {
        area(Content)
        {
            repeater(General)
            {
                field("Item Code"; Rec."Item Code")
                {
                    ToolTip = 'Specifies the value of the Item Code field.', Comment = '%';
                }
                field("Code"; Rec."Code")
                {
                    ToolTip = 'Specifies the value of the Code field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ToolTip = 'Specifies the value of the Start Date field.', Comment = '%';
                }
                field("End Date"; Rec."End Date")
                {
                    ToolTip = 'Specifies the value of the End Date field.', Comment = '%';
                }
                field(Active; Rec.Active)
                {
                    ToolTip = 'Specifies the value of the Active field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Active Certification")
            {
                Caption = 'Active Certification';
                ApplicationArea = All;
                trigger OnAction()
                var
                    BSVItemCert: Record "BSV Item Certification";
                begin
                    if BSVItemCert.FindSet() then begin
                        repeat
                            if (BSVItemCert."Start Date" <= Today) and (BSVItemCert."End Date" >= Today) then
                                BSVItemCert."Active" := true
                            else
                                BSVItemCert."Active" := false;

                            BSVItemCert.Modify();
                        until BSVItemCert.Next() = 0;
                    end;
                end;
            }
        }
    }
}

