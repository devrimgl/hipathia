
## Marta R. Hidalgo

library(hipathia)
context("Paths length normalization")

data("results")
mgi <- load_pathways("hsa", pathways_list = c("hsa03320", "hsa04012"))
p <- assay(results[["paths"]])
n <- normalize_paths(p, mgi)

test_that("Class is correct", {
    expect_is(n, "matrix")
})

test_that("Dimensions and dimnames are correct", {
    expect_equal(nrow(n), nrow(p))
    expect_equal(ncol(n), ncol(p))
    expect_equal(colnames(n), colnames(p))
    expect_equal(rownames(n), rownames(p))
})

test_that("Values are in rank", {
    expect_true(all(n <= 1 & n >= 0))
})
