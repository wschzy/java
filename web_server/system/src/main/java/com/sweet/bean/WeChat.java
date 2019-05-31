package com.sweet.bean;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;
@Data
public class WeChat implements Serializable {
    private static final long serialVersionUID = 426963197833831085L;

    private Integer id;
    @NotNull(message = "用户不能为空")
    private Integer userid;
    private Integer type;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;
    private String message;
}
