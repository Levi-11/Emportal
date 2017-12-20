module ApplicationHelper
    def full(page = "")
        base = "Employee Portal"
        if page.empty?
            base
        else
            page + " | " + base
        end
    end
end
