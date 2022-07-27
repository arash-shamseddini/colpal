########## Tests for edi_cols() ##########

# Testing the inputs

# Tests whether input is an EDI color
test_that("The input must be an EDI color or their combination", {
  expect_error(edi_cols(c(1, 2, 3)))
})

# Tests whether input is not missing
test_that("The input must not be empty", {
  expect_error(edi_cols())
})

# Tests whether input is an EDI color
test_that("The input must be an EDI color or their combination", {
  expect_error(edi_cols("Warm Blu"))
})

# Tests whether input size is never zero
test_that("The input must have a minimum length of one", {
  expect_error(edi_cols(c()))
})

# Tests whether input size is maximum three
test_that("The input must have a maximun length of three", {
  expect_error(edi_cols("Warm Blue", "Burnt Orange", "Dark Blue", "Warm Blue"))
})


# Testing the outputs

# Tests whether output is returned correctly
test_that("'Warm Blue' matches its hex code", {
  expect_equal(unname(edi_cols("Warm Blue")), "#007396")
})

# Tests whether output is returned correctly
test_that("'Burnt Orange' matches its hex code", {
  expect_equal(unname(edi_cols("Burnt Orange")), "#CF4520")
})

# Tests whether output is returned correctly
test_that("'Dark Blue' matches its hex code", {
  expect_equal(unname(edi_cols("Dark Blue")), "#004F71")
})


########## Tests for edi_pal() ##########

# Testing the inputs

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_pal(c(1)))
})

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_pal("red"))
})

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_pal(c()))
})

# Tests whether palette is of size one
test_that("The input must be an EDI palette of size one", {
  expect_error(edi_pal(c("main", "blue")))
})

# Tests whether palette is of size one
test_that("The input must be an EDI palette of size one", {
  expect_error(edi_pal(c("")))
})


# Tests whether `reverse` argument is either TRUE or FALSE
test_that("The 'reverse' argument must be logical", {
  expect_error(edi_pal("main", "blue"))
})

# Testing the outputs

# Tests whether output is returned correctly
test_that("'mixed' palette of size five (as an example) matches its hex codes", {
  expect_equal(edi_pal("mixed")(5), c("#007396", "#336778", "#675C5B", "#9B503D", "#CF4520"))
})

# Tests whether output is returned correctly
test_that("'mixed' reversed palette of size five (as an example) matches its hex codes", {
  expect_equal(edi_pal("mixed", TRUE)(5), c("#CF4520", "#9B503D", "#675C5B", "#336778", "#007396"))
})

# Tests whether output is a function
test_that("The output must have class 'function'", {
  expect_equal(class(edi_pal()), "function")
})

########## Test for edi_scale_col() ##########

# Testing the inputs

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_scale_col(c(1)))
})

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_scale_col("red"))
})

# Tests whether palette is of size one
test_that("The input must be an EDI palette of size one", {
  expect_error(edi_scale_col(c("main", "blue")))
})

# Tests whether palette is of size one
test_that("The input must be an EDI palette of size one", {
  expect_error(edi_scale_col(c()))
})

# Tests whether `reverse` argument is either TRUE or FALSE
test_that("The 'reverse' argument must be logical", {
  expect_error(edi_scale_col("main", TRUE, "blue"))
})

# Tests whether `discrete` argument is either TRUE or FALSE
test_that("The 'discrete' argument must be logical", {
  expect_error(edi_scale_col("main", "blue"))
})

# Testing the outputs

# Tests whether output is has the correct aesthetic
test_that("'colour' aesthetics is returned", {
  expect_equal(edi_scale_col("main")[[1]]$aesthetics, "colour")
})

# Tests whether output is the correct class
test_that("'ScaleContinuous' class is returned", {
  expect_true("ScaleContinuous" %in% as.character(edi_scale_col("main", FALSE)[[1]] %>% class()))
})


########## Test for edi_scale_fill() ##########

# Testing the inputs

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_scale_fill(c(1)))
})

# Tests whether input is an EDI palette
test_that("The input must be an EDI palette: 'main', 'blue' or 'mixed' ", {
  expect_error(edi_scale_fill("red"))
})

# Tests whether palette is of size one
test_that("The input must be an EDI palette of size one", {
  expect_error(edi_scale_fill(c("main", "blue")))
})

# Tests whether palette is of size one
test_that("The input must be an EDI palette of size one", {
  expect_error(edi_scale_fill(c()))
})

# Tests whether `reverse` argument is either TRUE or FALSE
test_that("The 'reverse' argument must be logical", {
  expect_error(edi_scale_fill("main", TRUE, "blue"))
})

# Tests whether `discrete` argument is either TRUE or FALSE
test_that("The 'discrete' argument must be logical", {
  expect_error(edi_scale_fill("main", "blue"))
})

# Testing the outputs

# Tests whether output is has the correct aesthetic
test_that("'colour' aesthetics is returned", {
  expect_equal(edi_scale_fill("main")[[1]]$aesthetics, "fill")
})

# Tests whether output is the correct class
test_that("'ScaleContinuous' class is returned", {
  expect_true("ScaleContinuous" %in% as.character(edi_scale_fill("main", FALSE)[[1]] %>% class()))
})
