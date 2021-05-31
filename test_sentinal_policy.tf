# sentinal is enforcing that any created
# EC2 instance must have at least '1' tag applied

# import "tfplan"
##
main = rule {
    all tfplan.resources.aws_instance as _, instances {
        all instances as _, r {
            (length(r.applied.tags) else 0) > 0
        }
    }
}