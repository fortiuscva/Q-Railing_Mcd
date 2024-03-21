codeunit 50100 "McdSalesLine_Tb"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Quantity', false, false)]
    local procedure SalesLine_Quantity_OnValidate(var Rec: Record "Sales Line")
    var
        ItemUnitOfMeasure: Record "Item Unit of Measure";
    begin
        if ItemUnitOfMeasure.Get(Rec."No.", 'BOX')then if ItemUnitOfMeasure."Qty. per Unit of Measure" <> 0 then if(rec.Quantity MOD ItemUnitOfMeasure."Qty. per Unit of Measure") <> 0 then Message('Quantity is not a multiple of Box Quantity');
        rec.McdTotalWeight:=rec.Quantity * rec."Gross Weight";
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterValidateEvent', 'Gross Weight', false, false)]
    local procedure SalesLine_GrossWeight_OnValidate(var Rec: Record "Sales Line")
    begin
        rec.McdTotalWeight:=rec.Quantity * rec."Gross Weight";
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Line", 'OnAfterInsertEvent', '', false, false)]
    local procedure SalesLine_OnInsert(RunTrigger: Boolean; var Rec: Record "Sales Line")
    var
        SalesHeader: Record "Sales Header";
    begin
        if not RunTrigger then exit;
        if(rec."Document Type" <> rec."Document Type"::Order) and (rec."Document Type" <> rec."Document Type"::"Credit Memo")then exit;
        if SalesHeader.get(Rec."Document Type", rec."Document No.")then begin
            rec.McdInnerSalespersonCode:=SalesHeader."Salesperson Code";
            rec.McdOuterSalespersonCode:=SalesHeader.McdOuterSalespersonCode;
        end;
    end;
}
