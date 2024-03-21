codeunit 50101 McdReleaseSalesDocument
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", OnBeforeOnRun, '', false, false)]
    local procedure OnBeforeOnRun(var SalesHeader: Record "Sales Header");
    begin
        if SalesHeader."Document Type" = SalesHeader."Document Type"::Order then begin
            SalesHeader.TestField("Salesperson Code");
            SalesHeader.TestField("Shipping Agent Code");
        end;
    end;
}
