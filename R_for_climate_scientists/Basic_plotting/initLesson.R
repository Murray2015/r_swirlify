# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.
.get_course_path <- function(){
  tryCatch(swirl:::swirl_courses_dir(),
           error = function(c) {file.path(find.package("swirl"),"Courses")}
  )
}

library(ncdf4)
ncfile = nc_open("yield.nc")
lat = ncvar_get(ncfile, "lat")
lon = ncvar_get(ncfile, "lon")
yield = ncvar_get(ncfile, "yield_mai")
yield_title = ncatt_get(ncfile, "yield_mai", "long_name")
yield_units = ncatt_get(ncfile, "yield_mai", "units")
nc_close(ncfile)
