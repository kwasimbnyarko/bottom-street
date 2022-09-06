class Overview {
  int? id;
  String? security;
  int? industryId;
  String? industry;
  int? sectorId;
  String? sector;
  double? mcap;
  String? ev;
  String? evDateEnd;
  double? bookNavPerShare;
  double? ttmpe;
  int? ttmYearEnd;
  double? theYield;
  int? yearEnd;
  String? sectorSlug;
  String? industrySlug;
  String? securitySlug;
  double? pegRatio;

  Overview(
      {this.id,
      this.security,
      this.industryId,
      this.industry,
      this.sectorId,
      this.sector,
      this.mcap,
      this.ev,
      this.evDateEnd,
      this.bookNavPerShare,
      this.ttmpe,
      this.ttmYearEnd,
      this.theYield,
      this.yearEnd,
      this.sectorSlug,
      this.industrySlug,
      this.securitySlug,
      this.pegRatio});
}
