tableextension 50110 McdSalesInvoiceLine extends "Sales Invoice Line"
{
    fields
    {
        field(50101; McdInnerSalespersonCode; Code[20])
        {
            Caption = 'Inner Salesperson Code';
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = lookup("Sales invoice Header"."Salesperson Code" where("No."=field("Document No.")));
        }
        field(50102; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            //TableRelation = "Salesperson/Purchaser" where(Blocked = const(false));
            FieldClass = FlowField;
            CalcFormula = lookup("Sales invoice Header".McdOuterSalespersonCode where("No."=field("Document No.")));
        }
    }
}
