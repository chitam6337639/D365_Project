namespace ALProject.ALProject;
using Microsoft.Inventory.Posting;
using Microsoft.Inventory.Ledger;
using Microsoft.Inventory.Item;
using Microsoft.Inventory.Journal;

codeunit 50101 "BSV Item Jnl Post"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Item Jnl.-Post Line", 'OnAfterInsertItemLedgEntry', '', true, true)]
    procedure SaveCertificationCode(ItemJournalLine: Record "Item Journal Line"; var ItemLedgerEntry: Record "Item Ledger Entry")
    var
        ItemRec: Record Item;
    begin
        if ItemRec.Get(ItemLedgerEntry."Item No.") then begin
            ItemLedgerEntry."Certification Code" := ItemRec."Certification Code";
            ItemLedgerEntry.Modify();
        end;
    end;
}
