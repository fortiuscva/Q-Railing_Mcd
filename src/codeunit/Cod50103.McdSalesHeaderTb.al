codeunit 50103 "McdSalesHeader_Tb"
{
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Sell-to Customer No.', false, false)]
    local procedure SalesHeader_SellToCustomerNo_OnValidate(var Rec: Record "Sales Header")
    var
        Customer: Record Customer;
    begin
        if Customer.get(rec."Sell-to Customer No.")then rec.validate(McdOuterSalespersonCode, Customer.McdOuterSalespersonCode);
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Order Date', false, false)]
    local procedure SalesHeader_OrderDate_OnValidate(var Rec: Record "Sales Header")
    begin
        if(rec."Document Type" = rec."Document Type"::Quote) and (Rec."Order Date" <> 0D)then begin
            rec.validate("Quote Valid Until Date", rec."Order Date" + 30);
        end;
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure Salesheader_OnInsert(RunTrigger: Boolean; var Rec: Record "Sales Header")
    begin
        if not RunTrigger then exit;
        if(rec."Document Type" = rec."Document Type"::Quote) and (Rec."Order Date" <> 0D)then begin
            rec.validate("Quote Valid Until Date", rec."Order Date" + 30);
        end;
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterModifyEvent', '', false, false)]
    local procedure Salesheader_OnModify(RunTrigger: Boolean; var Rec: Record "Sales Header")
    begin
        if not RunTrigger then exit;
        if(rec."Document Type" = rec."Document Type"::Quote) and (Rec."Order Date" <> 0D)then begin
            rec.validate("Quote Valid Until Date", rec."Order Date" + 30);
        end;
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnAfterOnInsert, '', false, false)]
    local procedure OnAfterOnInsert(var SalesHeader: Record "Sales Header");
    begin
        if(SalesHeader."Document Type" = SalesHeader."Document Type"::Quote) and (SalesHeader."Order Date" <> 0D)then begin
            SalesHeader.validate("Quote Valid Until Date", SalesHeader."Order Date" + 30);
        end;
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", OnCustomerCreditLimitExceeded, '', false, false)]
    local procedure OnCustomerCreditLimitExceeded(var Sender: Record "Sales Header"; NotificationId: Guid);
    begin
        Message('The customer''s credit limit has been exceeded.');
    end;
    [EventSubscriber(ObjectType::Table, Database::"Sales Header", 'OnAfterValidateEvent', 'Salesperson Code', false, false)]
    local procedure SalesHeader_SalesPerson_OnValidate(var Rec: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
    begin
        if(rec."Document Type" <> rec."Document Type"::Order) and (rec."Document Type" <> rec."Document Type"::"Credit Memo")then exit;
        SalesLine.Reset();
        SalesLine.SetRange("Document Type", rec."Document Type");
        SalesLine.SetRange("Document No.", rec."No.");
        if SalesLine.FindSet()then repeat SalesLine.McdInnerSalespersonCode:=rec."Salesperson Code";
                SalesLine.McdOuterSalespersonCode:=rec.McdOuterSalespersonCode;
                SalesLine.Modify();
            until SalesLine.Next() = 0;
    end;
}
