SELECT Region.RegionName
FROM VisitedRegion
INNER JOIN Region ON VisitedRegion.RegionId = Region.RegionId
WHERE VisitedRegion.CharacterId = 1;