tableextension 50109 McdCustomer extends Customer
{
    fields
    {
        field(50100; McdOuterSalespersonCode; Code[20])
        {
            Caption = 'Outer Salesperson Code';
            TableRelation = "Salesperson/Purchaser" where(Blocked=const(false));
        }
    }
}
