codeunit 50106 McdReportSubstitute
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ReportManagement, 'OnAfterSubstituteReport', '', false, false)]
    local procedure OnSubstituteReport(ReportId: Integer; var NewReportId: Integer)
    begin
        if ReportId = Report::"Pick Instruction" then NewReportId:=Report::McdPickInstruction;
    end;
}
