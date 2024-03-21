codeunit 50102 McdSalesPost
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure OnBeforePostSalesDoc(var Sender: Codeunit "Sales-Post"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer);
    begin
        SalesHeader.TestField("Salesperson Code");
        if(SalesHeader."Document Type" <> SalesHeader."Document Type"::"credit Memo") and (SalesHeader."Document Type" <> SalesHeader."Document Type"::"Return Order")then SalesHeader.TestField("Shipping Agent Code");
    end;
}
