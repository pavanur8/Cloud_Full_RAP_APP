@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Travel Id'
@Metadata.ignorePropagatedAnnotations: true
define view entity Z_TRAVEL_ID_VALUEHELP
  as select from zdb_tavel_data
{
    key  travel_id   as TravelId,
      agency_id as AgencyId

}
