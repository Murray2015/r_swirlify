# Code placed in this file fill be executed every time the
# lesson is started. Any variables created here will show up in
# the user's working directory and thus be accessible to them
# throughout the lesson.
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

# Load yield data 
library(ncdf4)
ncfile = nc_open("yield.nc")
yield = ncvar_get(ncfile, "yield_mai")
nc_close(ncfile)
yield_slice = yield[,,2]
yield_slice = yield_slice[,ncol(yield_slice):1]

# Load mask
mask_info = nc_open("ESA_forest_9regions_v2_1deg.nc")
mask = ncvar_get(mask_info, "region_mask")
nc_close(mask_info)