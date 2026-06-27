output "alb_url" {
  value = "http://${aws_lb.web.dns_name}"
}

output "autoscaling_group_name" {
  value = aws_autoscaling_group.web.name
}

output "target_group_arn" {
  value = aws_lb_target_group.web.arn
}
