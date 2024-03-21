pageextension 50102 McdSalesLines extends "Sales Lines"
{
    layout
    {
        addafter("Line Amount")
        {
            field(McdTotalWeight; Rec.McdTotalWeight)
            {
                ApplicationArea = All;
            }
        }
    }
}
