codeunit 50100 "BSV Sales Post Ext"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', true, true)]
    procedure ValidateCertificationOnPost(SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean)
    var
        SalesLine: Record "Sales Line";
        ItemRec: Record Item;
        ItemCert: Record "BSV Item Certification";
    begin
        SalesLine.SetRange("Document Type", SalesHeader."Document Type");
        SalesLine.SetRange("Document No.", SalesHeader."No.");
        if SalesLine.FindSet() then
            repeat
                if SalesLine.Type = SalesLine.Type::Item then begin
                    if ItemRec.Get(SalesLine."No.") then begin
                        if ItemRec."Certification Code" = '' then
                            Error('item does not have cert Code', SalesLine."No.");

                        if ItemCert.Get(ItemRec."No.", ItemRec."Certification Code") then begin
                            if ItemCert."End Date" < Today then
                                Error('the cert has expired', SalesLine."No.");
                        end;
                    end;
                end;
            until SalesLine.Next() = 0;
    end;
}
