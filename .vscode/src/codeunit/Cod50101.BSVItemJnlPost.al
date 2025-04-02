namespace ALProject.ALProject;
using Microsoft.Inventory.Posting;
using Microsoft.Inventory.Ledger;
using Microsoft.Sales.Posting;
using Microsoft.Inventory.Costing;
using Microsoft.Sales.Document;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Journal;

codeunit 50101 "BSV Item Jnl Post"
{
    //Get ItemLedgerEntry from Journaline
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnBeforeInsertItemLedgEntry', '', false, false)]
    local procedure OnBeforeInsertItemLedgEntry(var ItemLedgerEntry: Record "Item Ledger Entry"; ItemJournalLine: Record "Item Journal Line"; TransferItem: Boolean; OldItemLedgEntry: Record "Item Ledger Entry"; ItemJournalLineOrigin: Record "Item Journal Line")
    begin
        ItemLedgerEntry."Cert No." := ItemJournalLine."Cert No.";
    end;
    //Get ItemJnlLine from saleLine
    [EventSubscriber(ObjectType::Table, database::"Item Journal Line", 'OnAfterCopyItemJnlLineFromSalesLine', '', false, false)]
    local procedure OnAfterCopyItemJnlLineFromSalesLine(var ItemJnlLine: Record "Item Journal Line"; SalesLine: Record "Sales Line")
    begin
        ItemJnlLine."Cert No." := SalesLine."Cert No.";
    end;

    // Validate error before Post
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnBeforePostSalesDoc', '', false, false)]
    local procedure OnBeforePostSalesDoc(var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
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
