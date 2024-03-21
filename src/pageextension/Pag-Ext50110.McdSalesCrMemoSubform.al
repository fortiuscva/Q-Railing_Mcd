pageextension 50110 McdSalesCrMemoSubform extends "Sales Cr. Memo Subform"
{
    layout
    {
        addafter("Gross Weight")
        {
            field(McdInnerSalespersonCode; Rec.McdInnerSalespersonCode)
            {
                ApplicationArea = All;
            }
            field(McdOuterSalespersonCode; Rec.McdOuterSalespersonCode)
            {
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        addafter("Co&mments")
        {
            action("Restock Fee")
            {
                ApplicationArea = All;
                Image = NewSalesInvoice;

                trigger OnAction()
                var
                    SalesLine: Record "Sales Line";
                    LineNo: Integer;
                    SalesReceivablesSetup: Record "Sales & Receivables Setup";
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.get(rec."Document Type", rec."Document No.");
                    SalesReceivablesSetup.Get();
                    SalesReceivablesSetup.TestField(McdRestockAccountNo);
                    SalesReceivablesSetup.TestField(McdRestockFeePercentage);
                    SalesHeader.CalcFields(Amount);
                    SalesLine.Reset();
                    SalesLine.SetRange("Document Type", SalesHeader."Document Type");
                    SalesLine.SetRange("Document No.", SalesHeader."No.");
                    if SalesLine.FindLast()then LineNo:=SalesLine."Line No.";
                    LineNo+=10000;
                    SalesLine.Init();
                    SalesLine."Document Type":=SalesHeader."Document Type";
                    SalesLine."Document No.":=SalesHeader."No.";
                    SalesLine."Line No.":=LineNo;
                    SalesLine.Insert(true);
                    SalesLine.Validate(Type, SalesLine.Type::"G/L Account");
                    SalesLine.validate("No.", SalesReceivablesSetup.McdRestockAccountNo);
                    SalesLine.Validate(Quantity, 1);
                    SalesLine.Validate("Unit Price", -SalesHeader.Amount * (SalesReceivablesSetup.McdRestockFeePercentage / 100));
                    SalesLine.Modify();
                end;
            }
        }
    }
}
